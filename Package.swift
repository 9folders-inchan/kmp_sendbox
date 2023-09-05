// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.17/allshared-kmmbridge-0.1.17.zip"
let remoteKotlinChecksum = "7b8dd928288adc637324e818d16a9eb4fb4ffeb6d9447f434fde830760e59606"
let packageName = "allshared"
// END KMMBRIDGE BLOCK

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: packageName,
            targets: [packageName]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .binaryTarget(
            name: packageName,
            url: remoteKotlinUrl,
            checksum: remoteKotlinChecksum,
            dependencies: [.product(name: "Alamofire", package: "Alamofire")]
        )
    ]

)
