import BagbutikCore
import Foundation

/**
 # DeviceResponse

 The response body for endpoints that create, read, or modify a single registered device.

 ```
 object DeviceResponse
 ```

 ## See Also

 [`Register a new device`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-devices)

 Register a new device for app development.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/deviceresponse>
 */
public struct DeviceResponse: Codable, Sendable {
    public let data: Device
    public let links: DocumentLinks

    public init(data: Device,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Device.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
