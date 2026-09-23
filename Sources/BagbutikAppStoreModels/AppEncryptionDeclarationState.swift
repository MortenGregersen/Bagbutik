import BagbutikCore
import Foundation

/**
 # AppEncryptionDeclarationState

 Strings that represent the review or acceptance status of an app encryption declaration submitted to Apple.

 ```
 string AppEncryptionDeclarationState
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
