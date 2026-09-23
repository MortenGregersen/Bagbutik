import BagbutikCore
import Foundation

/**
 # AppClipAction

 A string that represents the call-to-action verb on the App Clip card.

 ```
 string AppClipAction
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipaction>
 */
public enum AppClipAction: String, Sendable, ParameterValue, Codable, CaseIterable {
    case open = "OPEN"
    case play = "PLAY"
    case view = "VIEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppClipAction(rawValue: string) {
            self = value
        } else if let value = AppClipAction(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppClipAction value: \(string)"
            )
        }
    }
}
