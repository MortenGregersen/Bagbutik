import BagbutikCore
import Foundation

/**
 # DevicesResponse

 The response body for endpoints that list registered devices.

 ```
 object DevicesResponse
 ```

 ## See Also

 [`List devices`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-devices)

 Find and list devices registered to your team.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/devicesresponse>
 */
public struct DevicesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = Device

    public let data: [Device]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Device],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([Device].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }
}
