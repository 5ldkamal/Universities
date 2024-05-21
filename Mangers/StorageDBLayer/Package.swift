// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StorageDBLayer",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "StorageDBLayer",
            targets: ["StorageDBLayer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "10.50.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "StorageDBLayer" ,
            dependencies: [.product(name: "RealmSwift", package: "realm-swift")]),
        .testTarget(
            name: "StorageDBLayerTests",
            dependencies: ["StorageDBLayer"]),
    ]
)
