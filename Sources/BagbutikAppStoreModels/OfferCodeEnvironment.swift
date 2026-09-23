import BagbutikCore
import Foundation

/**
 # OfferCodeEnvironment

 A string that represents the environment of an offer code.

 ```
 string OfferCodeEnvironment
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/offercodeenvironment>
 */
public enum OfferCodeEnvironment: String, Sendable, Codable, CaseIterable {
    case production = "PRODUCTION"
    case sandbox = "SANDBOX"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = OfferCodeEnvironment(rawValue: string) {
            self = value
        } else if let value = OfferCodeEnvironment(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid OfferCodeEnvironment value: \(string)"
            )
        }
    }
}
