import Foundation

/// Strings that represent the review or acceptance status of an app encryption declaration submitted to Apple.
public enum AppEncryptionDeclarationState: String, Codable, CaseIterable {
    case inReview = "IN_REVIEW"
    case approved = "APPROVED"
    case rejected = "REJECTED"
    case invalid = "INVALID"
    case expired = "EXPIRED"
}
