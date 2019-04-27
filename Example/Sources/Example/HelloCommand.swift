import FzkCLI

class HelloCommand: Command {
	private struct exitCodes {
		static let nameMissing:Int32 = 1
	}

	static let name = "hello"
	required init() {}

	func execute(_ parameters: [String]) -> CommandResult {
		guard let name = parameters.first
		else { return .error(exitCodes.nameMissing, "Name is required") }

		print("Hello to you, \(name)")
		return .success
	}
}
