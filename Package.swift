// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.40/allshared-kmmbridge-0.1.40.zip"
let remoteKotlinChecksum = "098db6dd874898091fea59d181eeb1f33462eb487cb2368e4cce379e7c802653"
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
            targets: ["DependencyTarget"]
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
              name: "DependencyTarget",
              dependencies: [.target(name: "DependencyWrapper",
                                     condition: .when(platforms: [.iOS]))]
            ),
        .target(
              name: "DependencyWrapper",
              dependencies: [
                .target(name: packageName, condition: .when(platforms: [.iOS])),
                .product(name: "Alamofire", package: "Alamofire")
              ]
            ),

    ]
)
