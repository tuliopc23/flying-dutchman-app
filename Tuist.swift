import ProjectDescription

let tuist = Tuist(
    fullHandle: "tuliopinheiroc23/flying-dutchman-app",
    project: .tuist(
        generationOptions: .options(
            optionalAuthentication: true,
            enableCaching: false,
            registryEnabled: false,
            projectFormat: .xcproj
        )
    )
)
