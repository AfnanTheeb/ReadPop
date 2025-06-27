// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ReadPopApp",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "ReadPopApp", targets: ["ReadPopApp"]),
        .library(name: "ReadPopCore", targets: ["ReadPopCore"]),
        .library(name: "ReadPopUI", targets: ["ReadPopUI"]),
        .library(name: "ReadPopArticles", targets: ["ReadPopArticles"]),
        .library(name: "ReadPopDependencies", targets: ["ReadPopDependencies"]),
        .library(name: "ReadPopEnvironment", targets: ["ReadPopEnvironment"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ReadPopCore",
            path: "Sources/ReadPopCore"
        ),
        .target(
            name: "ReadPopUI",
            path: "Sources/ReadPopUI",
            resources: [.process("Resources")]
        ),
        .target(
            name: "ReadPopArticles",
            dependencies: ["ReadPopCore", "ReadPopUI"],
            path: "Sources/ReadPopArticles"
        ),
        .target(
            name: "ReadPopEnvironment",
            path: "Sources/ReadPopEnvironment"
        ),
        .target(
            name: "ReadPopDependencies",
            dependencies: ["ReadPopArticles","ReadPopEnvironment"],
            path: "Sources/ReadPopDependencies"
        ),
        .target(
            name: "ReadPopApp",
            dependencies: [
                "ReadPopArticles",
                "ReadPopCore",
                "ReadPopUI",
                "ReadPopDependencies"
            ],
            path: "Sources/ReadPopApp"
        ),
        .testTarget(
            name: "ReadPopAppTests",
            dependencies: ["ReadPopApp"]
        ),
    ]
)
