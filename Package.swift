// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.22/allshared-kmmbridge-0.1.22.zip"
let remoteKotlinChecksum = "d5cb5f446c71e2b47a1a8e799309113169ae0de3cecb6a79e58f774b5da477b4"
let packageName = "allshared"
// END KMMBRIDGE BLOCK

let packageTarget = "\(packageName)target"
let packageWrapper = "\(packageName)wrapper"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: packageName,
            targets: [packageTarget, packageName]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .target(name: packageTarget,
                dependencies: [
                    .target(name: packageWrapper)
                ]
               ),
        .target(name: packageWrapper,
                dependencies: [
                    .target(name: packageName),
                    .product(name: "Alamofire", package: "Alamofire")
                ]
               ),
        .binaryTarget(
            name: packageName,
            url: remoteKotlinUrl,
            checksum: remoteKotlinChecksum
        )
    ]
)
