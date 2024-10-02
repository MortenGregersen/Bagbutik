import Bagbutik_Core
import Foundation

public enum AppEncryptionDeclarationState: String, Sendable, Codable, CaseIterable {
    case approved = "APPROVED"
    case created = "CREATED"
    case expired = "EXPIRED"
    case inReview = "IN_REVIEW"
    case invalid = "INVALID"
    case rejected = "REJECTED"
}
