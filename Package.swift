// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.41/allshared-kmmbridge-0.1.41.zip"
let remoteKotlinChecksum = "b08fde4bb0a7033833962075827da26a62e143031a1e209b1798db91aa20214a"
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
