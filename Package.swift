// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ClibSDL2",
    platforms: [
        .macOS(.v10_15)],
    products: [
        .executable(name: "TestSDL", targets: ["TestSDL"]),
        .library(name: "ClibSDL2", targets: ["ClibSDL2", "SDL"])],
    targets: [
        .target(name: "TestSDL", dependencies: ["ClibSDL2"]),
        .target(name: "SDL", dependencies: ["ClibSDL2"]),
        .target(name: "ClibSDL2", dependencies: ["libSDL2", "libSDL2_image"]),
        .binaryTarget(name: "libSDL2", path: "Frameworks/libSDL2.xcframework"),
        .binaryTarget(name: "libSDL2_image", path: "Frameworks/libSDL2_image.xcframework")])
