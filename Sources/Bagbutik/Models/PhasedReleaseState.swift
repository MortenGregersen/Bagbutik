import Foundation

/// String that represents the progress of a phased release for an app version.
public enum PhasedReleaseState: String, Codable, CaseIterable {
    case inactive = "INACTIVE"
    case active = "ACTIVE"
    case paused = "PAUSED"
    case complete = "COMPLETE"
}
