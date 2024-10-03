import Bagbutik_Core
import Foundation

public enum InternalBetaState: String, Sendable, Codable, CaseIterable {
    case expired = "EXPIRED"
    case inBetaTesting = "IN_BETA_TESTING"
    case inExportComplianceReview = "IN_EXPORT_COMPLIANCE_REVIEW"
    case missingExportCompliance = "MISSING_EXPORT_COMPLIANCE"
    case processing = "PROCESSING"
    case processingException = "PROCESSING_EXCEPTION"
    case readyForBetaTesting = "READY_FOR_BETA_TESTING"
}
