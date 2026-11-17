import Foundation

@MainActor
@Observable
public final class EmbeddedTerminalSession {
    public enum SessionState: String {
        case idle
        case starting
        case running
        case exited
        case failed
    }

    var state: SessionState = .idle
    var output: String = ""
    var input: String = ""
    var error: String?

    private var process: Process?
    private var stdinHandle: FileHandle?

    func start(command: String) {
        stop()
        state = .starting
        output = "$ \(command)\n"
        error = nil

        let process = Process()
        let stdinPipe = Pipe()
        let stdoutPipe = Pipe()
        let stderrPipe = Pipe()

        if FileManager.default.isExecutableFile(atPath: "/usr/bin/script") {
            process.executableURL = URL(fileURLWithPath: "/usr/bin/script")
            process.arguments = ["-q", "/dev/null", "/bin/zsh", "-lc", command]
        } else {
            process.executableURL = URL(fileURLWithPath: "/bin/zsh")
            process.arguments = ["-lc", command]
        }

        process.standardInput = stdinPipe
        process.standardOutput = stdoutPipe
        process.standardError = stderrPipe
        process.terminationHandler = { [weak self] task in
            Task { @MainActor [weak self] in
                self?.state = task.terminationStatus == 0 ? .exited : .failed
                self?.appendOutput("\n[process exited with status \(task.terminationStatus)]\n")
            }
        }

        stdoutPipe.fileHandleForReading.readabilityHandler = { [weak self] handle in
            let data = handle.availableData
            guard !data.isEmpty, let chunk = String(data: data, encoding: .utf8) else { return }
            Task { @MainActor [weak self] in
                self?.appendOutput(chunk)
            }
        }
        stderrPipe.fileHandleForReading.readabilityHandler = { [weak self] handle in
            let data = handle.availableData
            guard !data.isEmpty, let chunk = String(data: data, encoding: .utf8) else { return }
            Task { @MainActor [weak self] in
                self?.appendOutput(chunk)
            }
        }

        do {
            try process.run()
            self.process = process
            stdinHandle = stdinPipe.fileHandleForWriting
            state = .running
        } catch {
            self.error = error.localizedDescription
            state = .failed
            appendOutput("\n[failed to launch session: \(error.localizedDescription)]\n")
        }
    }

    func sendInput() {
        guard let stdinHandle else { return }
        let value = input + "\n"
        if let data = value.data(using: .utf8) {
            stdinHandle.write(data)
            appendOutput(value)
        }
        input = ""
    }

    func stop() {
        process?.terminate()
        process = nil
        stdinHandle = nil
        state = .idle
    }

    private func appendOutput(_ chunk: String) {
        output += chunk
    }
}
