// swift-tools-version:5.0

import PackageDescription

let package = Package(
	name: "swift-cli",
	products: [
		.library(
			name: "cli",
			targets: ["cli"]
		),
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "cli",
			dependencies: []
		),
		.testTarget(
			name: "cliTests",
			dependencies: ["cli"]
		),
	]
)
