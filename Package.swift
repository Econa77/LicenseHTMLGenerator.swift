// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LicenseHTMLGenerator.swift",
    products: [
        .executable(name: "license-html-generator", targets: ["LicenseHTMLGenerator.swift"]),
        .library(name: "LicenseHTMLGeneratorKit", targets: ["LicenseHTMLGeneratorKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.2.0"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "0.9.0"),
        .package(url: "https://github.com/kylef/Stencil.git", from: "0.13.0"),
        .package(name: "Yaml", url: "https://github.com/behrang/YamlSwift.git", from: "3.4.0"),
    ],
    targets: [
        .target(name: "LicenseHTMLGenerator.swift", dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser"),
                                                                   "LicenseHTMLGeneratorKit"]),
        .target(name: "LicenseHTMLGeneratorKit", dependencies: ["PathKit",
                                                                "Yaml",
                                                                "Stencil"]),
        .testTarget(name: "LicenseHTMLGenerator.swiftTests", dependencies: ["LicenseHTMLGenerator.swift"]),
    ]
)
