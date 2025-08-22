import Bagbutik_Core
import Foundation

public enum AppEncryptionDeclarationState: String, Sendable, Codable, CaseIterable {
    case approved = "APPROVED"
    case created = "CREATED"
    case expired = "EXPIRED"
    case inReview = "IN_REVIEW"
    case invalid = "INVALID"
    case rejected = "REJECTED"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppEncryptionDeclarationState(rawValue: string) {
            self = value
        } else if let value = AppEncryptionDeclarationState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppEncryptionDeclarationState value: \(string)"
            )
        }
    }
}
