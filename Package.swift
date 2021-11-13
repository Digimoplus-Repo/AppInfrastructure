// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppInfrastructure",
    products: [
        .library(
            name: "AppInfrastructure",
            targets: ["AppInfrastructure"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AppInfrastructure",
            dependencies: []),
        .testTarget(
            name: "AppInfrastructureTests",
            dependencies: ["AppInfrastructure"]),
    ]
)
