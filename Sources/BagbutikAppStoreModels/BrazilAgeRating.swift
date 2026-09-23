import BagbutikCore
import Foundation

/**
 # BrazilAgeRating

 String that represents the app’s age rating as it appears on the App Store in Brazil for all platforms.

 ```
 string BrazilAgeRating
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/brazilagerating>
 */
public enum BrazilAgeRating: String, Sendable, Codable, CaseIterable {
    case eighteen = "EIGHTEEN"
    case fourteen = "FOURTEEN"
    case l = "L"
    case sixteen = "SIXTEEN"
    case ten = "TEN"
    case twelve = "TWELVE"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BrazilAgeRating(rawValue: string) {
            self = value
        } else if let value = BrazilAgeRating(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BrazilAgeRating value: \(string)"
            )
        }
    }
}
