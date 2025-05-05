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
        .library(name: "FireplaceModel", type: .dynamic, targets: ["FireplaceModel"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.5.6"),
        .package(url: "https://source.skip.tools/skip-fuse-ui.git", "0.0.0"..<"2.0.0"),
        .package(url: "https://source.skip.tools/skip-model.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-fuse.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-firebase.git", "0.0.0"..<"2.0.0"),
    ],
    targets: [
        .target(name: "SkipNFirebaseUI", dependencies: [
            "LocalModel",
            .product(name: "SkipFuseUI", package: "skip-fuse-ui"),
            .product(name: "SkipFirebaseMessaging", package: "skip-firebase")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "LocalModel", dependencies: [
            "FireplaceModel",
            .product(name: "SkipModel", package: "skip-model"),
            .product(name: "SkipFuse", package: "skip-fuse")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "FireplaceModel", dependencies: [
            .product(name: "SkipFoundation", package: "skip-foundation"),
            .product(name: "SkipModel", package: "skip-model"),
            .product(name: "SkipFirebaseFirestore", package: "skip-firebase"),
            .product(name: "SkipFirebaseAuth", package: "skip-firebase")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ],
    swiftLanguageModes: [.v5]
)
