// swift-tools-version:5.0

import PackageDescription

let package = Package(
	name: "Example",
	platforms: [
		.macOS(.v10_12),
	],
	dependencies: [
		.package(url: "..", .branch("master")),
	],
	targets: [
		.target(
			name: "Example",
			dependencies: ["FzkCLI"]
		),
	]
)
