// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MenuBar",
    platforms: [
        .macOS(.v10_10),
    ],
    products: [
        .library(name: "MenuBar", targets: ["MenuBar"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "MenuBar", dependencies: []),
    ]
)
