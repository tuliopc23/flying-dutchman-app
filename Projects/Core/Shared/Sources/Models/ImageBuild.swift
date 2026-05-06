import Foundation
import Hummingbird

public struct ImageBuildRequest: Codable, Hashable, Sendable {
    public var contextPath: String
    public var dockerfilePath: String?
    public var tags: [String]
    public var platforms: [String]
    public var buildArguments: [String: String]

    public init(
        contextPath: String,
        dockerfilePath: String? = nil,
        tags: [String],
        platforms: [String] = [],
        buildArguments: [String: String] = [:]
    ) {
        self.contextPath = contextPath
        self.dockerfilePath = dockerfilePath
        self.tags = tags
        self.platforms = platforms
        self.buildArguments = buildArguments
    }
}

public struct ImageBuildResult: Codable, Hashable, Sendable, ResponseEncodable {
    public var image: ImageSummary
    public var logs: [String]
    public var builder: String

    public init(image: ImageSummary, logs: [String], builder: String) {
        self.image = image
        self.logs = logs
        self.builder = builder
    }
}
