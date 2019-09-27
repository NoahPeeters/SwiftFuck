// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftFuck",
    products: [
        .library(name: "SwiftFuck", targets: ["SwiftFuck"]),
        .executable(name: "SwiftFuckApp", targets: ["SwiftFuckApp"])
    ],
    targets: [
        .target(name: "SwiftFuck", dependencies: []),
        .testTarget(name: "SwiftFuckTests", dependencies: ["SwiftFuck"]),
        .target(name: "SwiftFuckApp", dependencies: ["SwiftFuck"]),
    ]
)
