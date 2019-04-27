import Foundation

public class CLI {
	private let name:String?
	private let commands:[Command.Type]

	public init(name:String? = nil, commands:[Command.Type]) {
		self.name = name
		self.commands = commands
	}

	public func evaluate(arguments:[String]) {
		guard let name = self.name ?? arguments.first
		else { return }

		guard arguments.count > 1
		else {
			print("""
			Usage: \(name) <command>
			Available commands: \(commands.map { $0.name }.joined(separator: ", "))
			""")
			exit(1)
		}

		let cmd = arguments[1]
		guard let command = commands.first(where: { $0.name == cmd })?.init()
		else {
			print("""
			Unknown command: \(cmd)
			Available commands: \(commands.map { $0.name }.joined(separator: ", "))
			""")
			exit(1)
		}

		switch command.execute(Array(arguments[2...])) {
		case .success:
			exit(0)
		case let .error(exitCode, reason):
			print(reason)
			exit(exitCode)
		case let .async(register):
			register {
				switch $0 {
				case .success:
					exit(0)
				case let .error(exitCode, reason):
					print(reason)
					exit(exitCode)
				}
			}
			let loop = RunLoop.current
			loop.run()
		}
	}
}
