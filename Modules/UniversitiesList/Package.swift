// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UniversitiesList",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UniversitiesList",
            targets: ["UniversitiesList"]),
    ],
    
    dependencies: [
        .package(path: ".././Mangers/NetworkLayer"),
        .package(path: ".././Mangers/StorageDBLayer"),
        .package(path: ".././Mangers/DomainLayer"),
        .package(path: ".././Mangers/LoaderView"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "UniversitiesList" ,
            dependencies: [
                "NetworkLayer",
                "StorageDBLayer",
                "DomainLayer",
                "LoaderView"
            ]
        ),
        .testTarget(
            name: "UniversitiesListTests",
            dependencies: ["UniversitiesList"]),
    ]
)
