// swift-tools-version:5.0

import PackageDescription

let package = Package(
	name: "swift-cli",
	products: [
		.library(
			name: "FzkCLI",
			targets: ["FzkCLI"]
		),
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "FzkCLI",
			dependencies: []
		),
		.testTarget(
			name: "cliTests",
			dependencies: ["FzkCLI"]
		),
	]
)
