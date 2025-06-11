import Bagbutik_Core
import Foundation

public enum ExternalBetaState: String, Sendable, Codable, CaseIterable {
    case betaApproved = "BETA_APPROVED"
    case betaRejected = "BETA_REJECTED"
    case expired = "EXPIRED"
    case inBetaReview = "IN_BETA_REVIEW"
    case inBetaTesting = "IN_BETA_TESTING"
    case inExportComplianceReview = "IN_EXPORT_COMPLIANCE_REVIEW"
    case missingExportCompliance = "MISSING_EXPORT_COMPLIANCE"
    case notApplicable = "NOT_APPLICABLE"
    case processing = "PROCESSING"
    case processingException = "PROCESSING_EXCEPTION"
    case readyForBetaSubmission = "READY_FOR_BETA_SUBMISSION"
    case readyForBetaTesting = "READY_FOR_BETA_TESTING"
    case waitingForBetaReview = "WAITING_FOR_BETA_REVIEW"
}
