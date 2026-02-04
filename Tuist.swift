import ProjectDescription

let tuist = Tuist(
    fullHandle: "tuliopinheiroc23/flying-dutchman-app",
    project: .tuist(
        generationOptions: .options(
            enableCaching: true,
            registryEnabled: true
        )
    )
)
