import BagbutikCore
import Foundation

/**
 # BetaTesterState

 String that describes the state of a beta tester.

 ```
 string BetaTesterState
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatesterstate>
 */
public enum BetaTesterState: String, Sendable, Codable, CaseIterable {
    case accepted = "ACCEPTED"
    case installed = "INSTALLED"
    case invited = "INVITED"
    case notInvited = "NOT_INVITED"
    case revoked = "REVOKED"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BetaTesterState(rawValue: string) {
            self = value
        } else if let value = BetaTesterState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BetaTesterState value: \(string)"
            )
        }
    }
}
