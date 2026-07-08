// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "Shader",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "Shader", targets: ["Shader"])
    ],
    targets: [
        .target(
            name: "Shader",
            path: "Shader",
            exclude: [
                "Shader.h",
                "Info.plist"
            ],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "ShaderTests",
            dependencies: ["Shader"],
            path: "Tests/ShaderTests",
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        )
    ]
)
