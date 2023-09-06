// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.42/allshared-kmmbridge-0.1.42.zip"
let remoteKotlinChecksum = "12491bed3e0ac208d7f8d5072e623a0a9024c50200cde1bc51e90dff1a41f143"
let packageName = "allshared"
// END KMMBRIDGE BLOCK

let packageDependency = "\(packageName)Dependency"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: packageName,
            targets: [packageName, packageDependency]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.0.0"))
    ]
    , targets: [
        .binaryTarget(
            name: packageName,
            url: remoteKotlinUrl,
            checksum: remoteKotlinChecksum
        ),
        .target(
              name: packageDependency,
              dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
              ],
              path: ""
        ),
    ]
)
