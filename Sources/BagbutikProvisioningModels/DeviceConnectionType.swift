import BagbutikCore
import Foundation

/**
 # DeviceConnectionType

 A string that represents the ways a device was connected for a specific crash.

 ```
 string DeviceConnectionType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/deviceconnectiontype>
 */
public enum DeviceConnectionType: String, Sendable, Codable, CaseIterable {
    case mobileData = "MOBILE_DATA"
    case none = "NONE"
    case unknown = "UNKNOWN"
    case wifi = "WIFI"
    case wire = "WIRE"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = DeviceConnectionType(rawValue: string) {
            self = value
        } else if let value = DeviceConnectionType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid DeviceConnectionType value: \(string)"
            )
        }
    }
}
