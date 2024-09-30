import Bagbutik_Core
import Foundation

/**
 # AppEncryptionDeclarationState
 Strings that represent the review or acceptance status of an app encryption declaration submitted to Apple.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclarationstate>
 */
public enum AppEncryptionDeclarationState: String, Sendable, Codable, CaseIterable {
    case approved = "APPROVED"
    case created = "CREATED"
    case expired = "EXPIRED"
    case inReview = "IN_REVIEW"
    case invalid = "INVALID"
    case rejected = "REJECTED"
}
