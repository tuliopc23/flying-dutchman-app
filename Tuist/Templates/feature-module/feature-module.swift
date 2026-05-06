import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Scaffold a feature module using makeFeature(...)",
    attributes: [nameAttribute],
    items: [
        .file(
            path: "Projects/Features/\(nameAttribute)/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Sources/\(nameAttribute)Interface/\(nameAttribute)Feature.swift",
            templatePath: "FeatureInterface.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Sources/\(nameAttribute)/\(nameAttribute)RootView.swift",
            templatePath: "FeatureView.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Sources/\(nameAttribute)Testing/\(nameAttribute)Testing.swift",
            templatePath: "FeatureTesting.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Examples/\(nameAttribute)Example/\(nameAttribute)ExampleApp.swift",
            templatePath: "ExampleApp.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Tests/\(nameAttribute)Tests/\(nameAttribute)Tests.swift",
            templatePath: "Tests.stencil"
        ),
    ]
)
