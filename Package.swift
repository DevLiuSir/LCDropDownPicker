// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCDropDownPicker",
    platforms: [
        .macOS(.v14), .iOS(.v16)
    ],
    
    products: [
        .library(
            name: "LCDropDownPicker",
            targets: ["LCDropDownPicker"]),
    ],
    targets: [
        .target(
            name: "LCDropDownPicker"),
        .testTarget(
            name: "LCDropDownPickerTests",
            dependencies: ["LCDropDownPicker"]),
    ]
)
