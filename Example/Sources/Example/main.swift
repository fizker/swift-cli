import FzkCLI

let cli = CLI(name: "awesome-program", commands: [
	HelloCommand.self,
	DownloadCommand.self,
])

cli.evaluate(arguments: CommandLine.arguments)
