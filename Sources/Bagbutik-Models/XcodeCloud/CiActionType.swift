import Bagbutik_Core
import Foundation

public enum CiActionType: String, Sendable, Codable, CaseIterable {
    case analyze = "ANALYZE"
    case archive = "ARCHIVE"
    case build = "BUILD"
    case test = "TEST"
}
