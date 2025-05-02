// swift-tools-version: 6.0
// This is a Skip (https://skip.tools) package.
import PackageDescription

let package = Package(
    name: "SkipNFirebase",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14), .tvOS(.v17), .watchOS(.v10), .macCatalyst(.v17)],
    products: [
        .library(name: "SkipNFirebaseUI", type: .dynamic, targets: ["SkipNFirebaseUI"]),
        .library(name: "LocalModel", type: .dynamic, targets: ["LocalModel"]),
        .library(name: "FirebaseModel", type: .dynamic, targets: ["FirebaseModel"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.5.6"),
        .package(url: "https://source.skip.tools/skip-fuse-ui.git", "0.0.0"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-model.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-fuse.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "SkipNFirebaseUI", dependencies: [
            "LocalModel",
            .product(name: "SkipFuseUI", package: "skip-fuse-ui")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "LocalModel", dependencies: [
            "FirebaseModel",
            .product(name: "SkipModel", package: "skip-model"),
            .product(name: "SkipFuse", package: "skip-fuse")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "FirebaseModel", dependencies: []),
    ]
)
