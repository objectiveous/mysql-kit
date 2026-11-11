// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "mysql-kit",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "MySQLKit", targets: ["MySQLKit"]),
    ],
    dependencies: [
        .package(path: "../async-kit"),
        .package(path: "../mysql-nio"),
        .package(path: "../sql-kit"),
        .package(url: "https://github.com/apple/swift-crypto.git", "2.0.0" ..< "5.0.0"),
        .package(path: "../swift-nio"),
        .package(path: "../swift-nio-ssl"),
    ],
    targets: [
        .target(
            name: "MySQLKit",
            dependencies: [
                .product(name: "AsyncKit", package: "async-kit"),
                .product(name: "MySQLNIO", package: "mysql-nio"),
                .product(name: "SQLKit", package: "sql-kit"),
                .product(name: "Crypto", package: "swift-crypto"),
                .product(name: "NIOFoundationCompat", package: "swift-nio"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "MySQLKitTests",
            dependencies: [
                .product(name: "SQLKitBenchmark", package: "sql-kit"),
                .target(name: "MySQLKit"),
            ],
            swiftSettings: swiftSettings
        ),
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableExperimentalFeature("StrictConcurrency=complete"),
] }
