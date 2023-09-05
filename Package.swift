// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.21/allshared-kmmbridge-0.1.21.zip"
let remoteKotlinChecksum = "bc562045826656a150ab834ebc1058982dfce442ee778229adf27d79bec26881"
let packageName = "allshared"
// END KMMBRIDGE BLOCK
let target = "\(packageName)target"
let wrapper = "\(packageName)wrapper"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: packageName,
            targets: [target]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .target(name: target,
                dependencies: [
                    .target(name: wrapper)
                ]
               ),
        .target(name: wrapper,
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
