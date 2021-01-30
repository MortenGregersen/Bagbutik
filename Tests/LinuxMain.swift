import XCTest

import BagbutikTests

var tests = [XCTestCaseEntry]()
tests += BagbutikGeneratorTests.allTests()
tests += BagbutikSpecDecoderTests.allTests()
tests += BagbutikTests.allTests()
XCTMain(tests)
