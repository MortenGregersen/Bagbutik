import BagbutikCore
import Foundation

/**
 # InternalBetaState

 String that represents a build’s availability for internal testing.

 ```
 string InternalBetaState
 ```

 ## Discussion

 -`PROCESSING`:
 -`PROCESSING_EXCEPTION`:
 -`MISSING_EXPORT_COMPLIANCE`:
 -`READY_FOR_BETA_TESTING`:
 -`IN_BETA_TESTING`:
 -`EXPIRED`:
 -`IN_EXPORT_COMPLIANCE_REVIEW`:

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/internalbetastate>
 */
public enum InternalBetaState: String, Sendable, Codable, CaseIterable {
    case expired = "EXPIRED"
    case inBetaTesting = "IN_BETA_TESTING"
    case inExportComplianceReview = "IN_EXPORT_COMPLIANCE_REVIEW"
    case missingExportCompliance = "MISSING_EXPORT_COMPLIANCE"
    case processing = "PROCESSING"
    case processingException = "PROCESSING_EXCEPTION"
    case readyForBetaTesting = "READY_FOR_BETA_TESTING"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = InternalBetaState(rawValue: string) {
            self = value
        } else if let value = InternalBetaState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid InternalBetaState value: \(string)"
            )
        }
    }
}
