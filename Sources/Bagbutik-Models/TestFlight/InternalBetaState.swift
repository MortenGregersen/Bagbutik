import Bagbutik_Core
import Foundation

/**
 # InternalBetaState
 String that represents a build's availability for internal testing.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/internalbetastate>
 */
public enum InternalBetaState: String, Codable, CaseIterable {
    case expired = "EXPIRED"
    case inBetaTesting = "IN_BETA_TESTING"
    case inExportComplianceReview = "IN_EXPORT_COMPLIANCE_REVIEW"
    case missingExportCompliance = "MISSING_EXPORT_COMPLIANCE"
    case processing = "PROCESSING"
    case processingException = "PROCESSING_EXCEPTION"
    case readyForBetaTesting = "READY_FOR_BETA_TESTING"
}
