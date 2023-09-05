// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.15/allshared-kmmbridge-0.1.15.zip"
let remoteKotlinChecksum = "9889e834c37b57a1485165b171d2a3feecdc8b22d7d6ea31396c309c20005c28"
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
            dependencies: ["Alamofire"]
        )
        ,
    ]

)