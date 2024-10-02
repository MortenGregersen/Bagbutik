import Bagbutik_Core
import Foundation

public enum PhasedReleaseState: String, Sendable, Codable, CaseIterable {
    case active = "ACTIVE"
    case complete = "COMPLETE"
    case inactive = "INACTIVE"
    case paused = "PAUSED"
}
