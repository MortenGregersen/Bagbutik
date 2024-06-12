import Bagbutik_Core
import Foundation

/**
 # DiagnosticInsightType
 A string that desribes the diagnostic insight type.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticinsighttype>
 */
public enum DiagnosticInsightType: String, Codable, CaseIterable {
    /// Represents an insight type that indicates how the impact of signatures has changed between the current version and previous versions.
    case trend = "TREND"
}
