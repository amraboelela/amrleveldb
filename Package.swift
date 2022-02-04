// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "amrleveldb",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "amrleveldb",
            targets: ["amrleveldb"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    ]
)
#if os(Linux)
package.targets.append(
    .target(
        name: "amrleveldb",
        dependencies: ["leveldb_linux"],
        exclude: ["include/port/README"]
    )
)
package.targets.append(
    .target(
        name: "leveldb_linux",
        dependencies: [],
        exclude: ["port/README"]
    )
)
#else
package.targets.append(
    .target(
        name: "amrleveldb",
        dependencies: ["leveldb_macos"],
        exclude: ["include/port/README"]
    )
)
package.targets.append(
    .target(
        name: "leveldb_macos",
        dependencies: []
    )
)
#endif
