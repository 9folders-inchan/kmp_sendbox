// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.23/allshared-kmmbridge-0.1.23.zip"
let remoteKotlinChecksum = "b87e21f427d4c8cf97084772047e9cfb5ab95cb9dc5d56471c01c2047d4c7fef"

let packageName = "allshared"

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
