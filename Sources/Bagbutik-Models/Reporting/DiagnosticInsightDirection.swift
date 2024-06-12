import Bagbutik_Core
import Foundation

/**
 # DiagnosticInsightDirection
 A string that describes the diagnostic insight direction.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticinsightdirection>
 */
public enum DiagnosticInsightDirection: String, Codable, CaseIterable {
    /// The impact of this signature has progressed in the current version compared to previous versions.
    case down = "DOWN"
    /// No significant change in impact of this signature in the current version compared to previous versions.
    case undefined = "UNDEFINED"
    /// The impact of this signature has regressed in the current version compared to previous versions.
    case up = "UP"
}
