import BagbutikCore
import Foundation

/**
 # BuildAudienceType

 A string that represents the App Store Connect audience for a build.

 ```
 string BuildAudienceType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildaudiencetype>
 */
public enum BuildAudienceType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case appStoreEligible = "APP_STORE_ELIGIBLE"
    case internalOnly = "INTERNAL_ONLY"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BuildAudienceType(rawValue: string) {
            self = value
        } else if let value = BuildAudienceType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BuildAudienceType value: \(string)"
            )
        }
    }
}
