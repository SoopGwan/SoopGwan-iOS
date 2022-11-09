import ProjectDescriptionHelpers
import ProjectDescription

let project = Project.excutable(
    name: "SoopGwan",
    platform: .iOS,
    deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
    dependencies: [
        .project(target: "Service", path: "../Service")
    ]
)
