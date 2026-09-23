import BagbutikCore
import Foundation

/**
 # BundleIdPlatform

 Strings that represent the operating system intended for the bundle.

 ```
 string BundleIdPlatform
 ```

 ## Discussion

 -`IOS`: A string that represents iOS.
 -`MAC_OS`: A string that represents macOS.
 -`UNIVERSAL`: A string that represents all possible platforms.

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidplatform>
 */
public enum BundleIdPlatform: String, Sendable, ParameterValue, Codable, CaseIterable {
    case iOS = "IOS"
    case macOS = "MAC_OS"
    case services = "SERVICES"
    case universal = "UNIVERSAL"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BundleIdPlatform(rawValue: string) {
            self = value
        } else if let value = BundleIdPlatform(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BundleIdPlatform value: \(string)"
            )
        }
    }
}
