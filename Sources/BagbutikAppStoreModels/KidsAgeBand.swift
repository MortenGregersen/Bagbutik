import BagbutikCore
import Foundation

/**
 # KidsAgeBand

 String that represents the age band for a Made for Kids app.

 ```
 string KidsAgeBand
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/kidsageband>
 */
public enum KidsAgeBand: String, Sendable, Codable, CaseIterable {
    case fiveAndUnder = "FIVE_AND_UNDER"
    case nineToEleven = "NINE_TO_ELEVEN"
    case sixToEight = "SIX_TO_EIGHT"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = KidsAgeBand(rawValue: string) {
            self = value
        } else if let value = KidsAgeBand(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid KidsAgeBand value: \(string)"
            )
        }
    }
}
