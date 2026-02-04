import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "NetworkKit",
    targets: [
        .domain(
            name: "FlyingDutchmanNetworking",
            dependencies: [
                .project(target: "Shared", path: "../../Core/Shared"),
                .project(target: "FlyingDutchmanPersistence", path: "../../Core/Persistence"),
                .project(target: "FlyingDutchmanContainers", path: "../ContainerKit"),
                .external(name: "Hummingbird"),
                .external(name: "HummingbirdHTTP2"),
                .external(name: "HummingbirdTLS"),
                .external(name: "AsyncHTTPClient"),
                .external(name: "DNSClient"),
                .external(name: "X509"),
            ]
        ),
    ]
)
