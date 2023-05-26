// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var dependencies: [Package.Dependency] = [
    .package(name: "IndexStoreDB", url: "https://github.com/apple/indexstore-db.git", .branch("release/5.7")),
    .package(name: "swift-tools-support-core", url: "https://github.com/apple/swift-tools-support-core.git", .branch("release/5.7")),
    .package(url: "https://github.com/jpsim/Yams.git", from: "2.0.0"),
    .package(url: "https://github.com/apple/swift-argument-parser.git", .exact("0.3.2")),
]

dependencies.append(
    .package(
        name: "SwiftSyntax",
        url: "https://github.com/apple/swift-syntax",
        .exact("0.50700.1")
    )
)

let package = Package(
    name: "pecker",
    products: [
        .executable(name: "pecker", targets: ["Pecker"])
    ],
    dependencies: dependencies,
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Pecker",
            dependencies: [
                "PeckerKit",
                .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core"),
                .product(name: "ArgumentParser", package: "swift-argument-parser")]
        ),
        .target(
            name: "PeckerKit",
            dependencies: [
                .product(name: "SwiftSyntax", package: "SwiftSyntax"),
                .product(name: "SwiftSyntaxParser", package: "SwiftSyntax"),
                "IndexStoreDB",
                .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core"),
                "Yams"
            ]
        ),
        .testTarget(
            name: "PeckerTests",
            dependencies: ["Pecker"]),
    ]
)
