// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "ClibSDL2",
    platforms: [
        .macOS(SupportedPlatform.MacOSVersion.v12)],
    products: [
        .library(name: "ClibSDL2", targets: ["ClibSDL2"])],
    targets: [
        .executableTarget(name: "TestSDL", dependencies: ["ClibSDL2"]),
        .target(name: "ClibSDL2", dependencies: ["libSDL2", "libSDL2_image"]),
        .binaryTarget(name: "libSDL2", path: "Frameworks/libSDL2.xcframework"),
        .binaryTarget(name: "libSDL2_image", path: "Frameworks/libSDL2_image.xcframework")])
