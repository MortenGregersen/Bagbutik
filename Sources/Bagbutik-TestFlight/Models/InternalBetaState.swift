import Foundation
import Bagbutik_Core

/**
 # InternalBetaState
 String that represents a build's availability for internal testing.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/internalbetastate>
 */
public enum InternalBetaState: String, Codable, CaseIterable {
    case processing = "PROCESSING"
    case processingException = "PROCESSING_EXCEPTION"
    case missingExportCompliance = "MISSING_EXPORT_COMPLIANCE"
    case readyForBetaTesting = "READY_FOR_BETA_TESTING"
    case inBetaTesting = "IN_BETA_TESTING"
    case expired = "EXPIRED"
    case inExportComplianceReview = "IN_EXPORT_COMPLIANCE_REVIEW"
}
