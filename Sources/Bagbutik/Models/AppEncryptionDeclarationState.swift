import Foundation

public enum AppEncryptionDeclarationState: String, Codable, CaseIterable {
    case inReview = "IN_REVIEW"
    case approved = "APPROVED"
    case rejected = "REJECTED"
    case invalid = "INVALID"
    case expired = "EXPIRED"
}
