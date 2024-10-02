import Bagbutik_Core
import Foundation

public enum CiTestStatus: String, Sendable, Codable, CaseIterable {
    case expectedFailure = "EXPECTED_FAILURE"
    case failure = "FAILURE"
    case mixed = "MIXED"
    case skipped = "SKIPPED"
    case success = "SUCCESS"
}
