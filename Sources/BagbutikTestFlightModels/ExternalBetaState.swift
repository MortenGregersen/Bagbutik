import BagbutikCore
import Foundation

/**
 # ExternalBetaState

 String that represents a build’s availability for external testing.

 ```
 string ExternalBetaState
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/externalbetastate>
 */
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = ExternalBetaState(rawValue: string) {
            self = value
        } else if let value = ExternalBetaState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid ExternalBetaState value: \(string)"
            )
        }
    }
}
