import XCTest

import swift_cliTests

var tests = [XCTestCaseEntry]()
tests += swift_cliTests.allTests()
XCTMain(tests)
