import Foundation

/// A string that represents test status information.
public enum CiTestStatus: String, Codable, CaseIterable {
    /// The tests passed.
    case success = "SUCCESS"
    /// The tests failed.
    case failure = "FAILURE"
    /// Some tests passed and some failed.
    case mixed = "MIXED"
    /// Xcode Cloud skipped some tests.
    case skipped = "SKIPPED"
    /// Tests failed that you marked as expected to fail with [XCTExpectFailure](https://developer.apple.com/documentation/xctest/3726077-xctexpectfailure).
    case expectedFailure = "EXPECTED_FAILURE"
}
