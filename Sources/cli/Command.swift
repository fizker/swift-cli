public enum CommandResult {
	case success, error(Int32, String), async((@escaping (AsyncCommandResult)->())->())
}
public enum AsyncCommandResult {
	case success, error(Int32, String)
}

public protocol Command {
	static var name:String {get}
	init()
	func execute(_ parameters:[String]) -> CommandResult
}
