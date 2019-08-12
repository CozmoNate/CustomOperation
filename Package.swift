// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CustomOperation",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
        .watchOS(.v3),
        .tvOS(.v10)
    ],
    products: [
        .library(name: "CustomOperation", targets: ["CustomOperation"]),
    ],
    targets: [
        .target(name: "CustomOperation", dependencies: [], path: "CustomOperation"),
    ],
    swiftLanguageVersions: [ .v5 ]
)
