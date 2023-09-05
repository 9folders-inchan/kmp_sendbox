// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.19/allshared-kmmbridge-0.1.19.zip"
let remoteKotlinChecksum = "c33472151fece5b6ae93cc1f62721b7ac329f720ea948428574f8da16a706573"
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
            targets: [packageName + "target"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .target(name: packageName + "target", dependencies: [.target(name: packageName + "wrapper")]),
        .target(name: packageName + "wrapper", dependencies: [
            .target(name: packageName)
            .product(name: "Alamofire", package: "Alamofire")
        ]),
        .binaryTarget(
            name: packageName,
            url: remoteKotlinUrl,
            checksum: remoteKotlinChecksum
        )
    ]
)
