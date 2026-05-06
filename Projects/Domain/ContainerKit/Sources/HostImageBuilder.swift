import Foundation
import Shared

enum HostImageBuilder {
    struct Invocation {
        let executable: String
        let arguments: [String]
        let builderName: String
    }

    static func build(request: ImageBuildRequest) throws -> (ImageSummary, [String], String) {
        let invocation = try resolveInvocation(for: request)
        let output = try run(executable: invocation.executable, arguments: invocation.arguments)
        let primaryTag = try primaryTag(from: request.tags)
        let image = imageSummary(for: primaryTag, buildOutput: output)
        return (image, output, invocation.builderName)
    }

    private static func resolveInvocation(for request: ImageBuildRequest) throws -> Invocation {
        let contextPath = request.contextPath.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !contextPath.isEmpty else {
            throw ContainerError.configurationInvalid("Build context path is required")
        }

        let tagArguments = request.tags.flatMap { ["-t", $0] }
        let platformArgument = request.platforms.isEmpty ? [] : ["--platform", request.platforms.joined(separator: ",")]
        let buildArgumentFlags = request.buildArguments
            .sorted { $0.key < $1.key }
            .flatMap { ["--build-arg", "\($0.key)=\($0.value)"] }
        let dockerfileArgument = request.dockerfilePath.map { ["-f", $0] } ?? []

        let explicit = ProcessInfo.processInfo.environment["FD_IMAGE_BUILD_COMMAND"]?
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if let explicit, !explicit.isEmpty {
            return Invocation(executable: "/bin/zsh", arguments: ["-lc", explicit], builderName: "custom")
        }

        let candidates = builderCandidates(
            contextPath: contextPath,
            platformArgument: platformArgument,
            dockerfileArgument: dockerfileArgument,
            tagArguments: tagArguments,
            buildArgumentFlags: buildArgumentFlags
        )

        for candidate in candidates {
            if commandExists(candidate.arguments.first ?? candidate.executable) {
                return Invocation(
                    executable: candidate.executable,
                    arguments: candidate.arguments,
                    builderName: candidate.name
                )
            }
        }

        throw ContainerError.runtimeUnavailable(
            "No supported image builder found. Install docker, podman, nerdctl, or container, or set FD_IMAGE_BUILD_COMMAND."
        )
    }

    private static func builderCandidates(
        contextPath: String,
        platformArgument: [String],
        dockerfileArgument: [String],
        tagArguments: [String],
        buildArgumentFlags: [String]
    ) -> [(name: String, executable: String, arguments: [String])] {
        [
            (
                "docker-buildx",
                "/usr/bin/env",
                ["docker", "buildx", "build", "--load"] + platformArgument + dockerfileArgument + tagArguments +
                    buildArgumentFlags + [contextPath]
            ),
            (
                "docker",
                "/usr/bin/env",
                ["docker", "build"] + dockerfileArgument + tagArguments + buildArgumentFlags + [contextPath]
            ),
            (
                "podman",
                "/usr/bin/env",
                ["podman", "build"] + platformArgument + dockerfileArgument + tagArguments + buildArgumentFlags +
                    [contextPath]
            ),
            (
                "nerdctl",
                "/usr/bin/env",
                ["nerdctl", "build"] + platformArgument + dockerfileArgument + tagArguments + buildArgumentFlags +
                    [contextPath]
            ),
            (
                "container",
                "/usr/bin/env",
                ["container", "build"] + dockerfileArgument + tagArguments + buildArgumentFlags + [contextPath]
            ),
        ]
    }

    private static func primaryTag(from tags: [String]) throws -> String {
        guard let first = tags.first?.trimmingCharacters(in: .whitespacesAndNewlines), !first.isEmpty else {
            throw ContainerError.configurationInvalid("At least one tag is required")
        }
        return first
    }

    private static func imageSummary(for tag: String, buildOutput: [String]) -> ImageSummary {
        let components = tag.split(separator: ":", maxSplits: 1, omittingEmptySubsequences: false)
        let name = String(components.first ?? Substring(tag))
        let imageTag = components.count > 1 ? String(components[1]) : "latest"
        let digestLine = buildOutput.last(where: { $0.contains("sha256:") })
        let digest = digestLine.flatMap { line in
            line.split(separator: " ").first(where: { $0.contains("sha256:") }).map(String.init)
        }

        return ImageSummary(name: name, tag: imageTag, digest: digest)
    }

    private static func commandExists(_ command: String) -> Bool {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/which")
        process.arguments = [command]
        process.standardOutput = Pipe()
        process.standardError = Pipe()
        do {
            try process.run()
            process.waitUntilExit()
            return process.terminationStatus == 0
        } catch {
            return false
        }
    }

    private static func run(executable: String, arguments: [String]) throws -> [String] {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: executable)
        process.arguments = arguments

        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = outputPipe

        try process.run()
        process.waitUntilExit()

        let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(decoding: data, as: UTF8.self)
            .split(whereSeparator: \.isNewline)
            .map(String.init)

        guard process.terminationStatus == 0 else {
            let reason = output.isEmpty ? "exit code \(process.terminationStatus)" : output.joined(separator: "\n")
            throw ContainerError.lifecycleFailed(operation: "build image", reason: reason)
        }

        return output.isEmpty ? ["Build completed."] : output
    }
}
