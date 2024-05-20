// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StorageLayer",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "StorageLayer",
            targets: ["StorageLayer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git",
                 exact: "10.50.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "StorageLayer",
            dependencies: ["RealmSwift"]
        ),
        .testTarget(
            name: "StorageLayerTests",
            dependencies: ["StorageLayer"]
        ),
    ]
)
