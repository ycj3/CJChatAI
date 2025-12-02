// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CJChatAI",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CJChatAI",
            targets: ["CJChatAI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/gonzalezreal/swift-markdown-ui.git", exact: "2.4.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CJChatAI",
            dependencies: [
                .product(name: "MarkdownUI", package: "swift-markdown-ui")
            ]
        ),
        .target(
            name: "SwiftUIChatDemo",
            dependencies: ["CJChatAI"]
        ),
        .testTarget(
            name: "CJChatAITests",
            dependencies: ["CJChatAI"]
        ),
    ]
)
