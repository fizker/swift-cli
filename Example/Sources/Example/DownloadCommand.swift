import Foundation

import FzkCLI

class DownloadCommand: Command {
	private struct exitCodes {
		static let urlMissing:Int32 = 1
		static let invalidContent:Int32 = 2
	}

	static let name = "download"
	required init() {}

	func execute(_ parameters: [String]) -> CommandResult {
		guard let url = parameters.first
		else { return .error(exitCodes.urlMissing, "URL is required") }

		return .async { (onComplete) in
			print("Starting download. This takes 2 seconds.")
			self.download(from: url) { content in
				if let content = content {
					print(content)
					onComplete(.success)
				} else {
					onComplete(.error(exitCodes.invalidContent, "Content could not be downloaded"))
				}
			}
		}
	}

	private func download(from url:String, block:@escaping (String?) -> ()) {
		Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
			if url.contains("success") {
				block("Download succeeded")
			} else {
				block(nil)
			}
		}
	}
}
