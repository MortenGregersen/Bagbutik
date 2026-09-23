import BagbutikCore
import Foundation

/**
 # BetaInviteType

 String that indicates how you offer a beta invitation.

 ```
 string BetaInviteType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betainvitetype>
 */
public enum BetaInviteType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case email = "EMAIL"
    case publicLink = "PUBLIC_LINK"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BetaInviteType(rawValue: string) {
            self = value
        } else if let value = BetaInviteType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BetaInviteType value: \(string)"
            )
        }
    }
}
