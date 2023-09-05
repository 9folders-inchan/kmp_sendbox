// swift-tools-version:5.3
import PackageDescription

// BEGIN KMMBRIDGE VARIABLES BLOCK (do not edit)
let remoteKotlinUrl = "https://maven.pkg.github.com/9folders-inchan/kmp_sendbox/com/9folders/kmp/sendbox/allshared-kmmbridge/0.1.4/allshared-kmmbridge-0.1.4.zip"
let remoteKotlinChecksum = "14e93fe6124087b6e809592e075fbb4956f694bf6994a6c3b73577c1ef5b507a"
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
    targets: [
        .binaryTarget(
            name: packageName,
            url: remoteKotlinUrl,
            checksum: remoteKotlinChecksum
        )
        ,
    ]
)