import BagbutikCore
import Foundation

/**
 # DeviceFamily

 String that represents a device family.

 ```
 string DeviceFamily
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/devicefamily>
 */
public enum DeviceFamily: String, Sendable, ParameterValue, Codable, CaseIterable {
    case appleTV = "APPLE_TV"
    case appleWatch = "APPLE_WATCH"
    case iPad = "IPAD"
    case iPhone = "IPHONE"
    case mac = "MAC"
    case vision = "VISION"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = DeviceFamily(rawValue: string) {
            self = value
        } else if let value = DeviceFamily(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid DeviceFamily value: \(string)"
            )
        }
    }
}
