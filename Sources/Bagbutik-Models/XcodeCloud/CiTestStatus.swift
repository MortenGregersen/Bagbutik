import Bagbutik_Core
import Foundation

/**
 # CiTestStatus
 A string that represents test status information.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citeststatus>
 */
public enum CiTestStatus: String, Codable, CaseIterable {
    /// Tests failed that you marked as expected to fail with [XCTExpectFailure](https://developer.apple.com/documentation/xctest/3726077-xctexpectfailure).
    case expectedFailure = "EXPECTED_FAILURE"
    /// The tests failed.
    case failure = "FAILURE"
    /// Some tests passed and some failed.
    case mixed = "MIXED"
    /// Xcode Cloud skipped some tests.
    case skipped = "SKIPPED"
    /// The tests passed.
    case success = "SUCCESS"
}
