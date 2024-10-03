import Bagbutik_Core
import Foundation

public enum CiCompletionStatus: String, Sendable, Codable, CaseIterable {
    case canceled = "CANCELED"
    case errored = "ERRORED"
    case failed = "FAILED"
    case skipped = "SKIPPED"
    case succeeded = "SUCCEEDED"
}
