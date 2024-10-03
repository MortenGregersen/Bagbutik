import Bagbutik_Core
import Foundation

public enum CiGitRefKind: String, Sendable, Codable, CaseIterable {
    case branch = "BRANCH"
    case tag = "TAG"
}
