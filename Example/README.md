# Example

An example program for FzkCLI.


## Usage

First, execute `swift build` to compile the example.

Then `swift run Example` executes the code. Omitting a command like in that snippet
outputs a usage-blurp which includes the names of the commands:

```
Usage: awesome-program <command>
Available commands: hello, download
```

## Synchronous example

See [HelloCommand.swift](Sources/Example/HelloCommand.swift) for the code.

To run the command, do `swift run Example hello [name]`.

The library calls `Swift.exit(exitCode)` immediately if `execute(_)` returns `.success` or `.error(code, reason)`.

The exit-code is `0` for `.success` or it prints `reason` and then exits with `code` taken from `.error(code:Int, reason:String)`.


## Async example

See [DownloadCommand.swift](Sources/Example/DownloadCommand.swift) for the code.

If `execute(_)` returns `.async(function)`, the library immediately calls `function` with a
block that takes either `.success` or `.error(code, reason)`. The program is kept alive until
the block is called, after which it exists in the same manner as with the synchronous flow.

To run the command, do `swift run Example download [url]`.

If `url` is missing, it will exit immediately. If it is included, the program will hang for 2 seconds
before exiting.

If the `url` includes the string `success`, it will eventually exit with code 0, otherwise it will
exit with code 2.
