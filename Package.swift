// swift-tools-version:5.3
import PackageDescription

let packageName = "allshared"
let dependencyTarget = "DependencyTarget"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: packageName,
            targets: [packageName]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .binaryTarget(
            name: packageName,
            path: "./allshared/build/XCFrameworks/debug/\(packageName).xcframework"
        )
    ]

)
