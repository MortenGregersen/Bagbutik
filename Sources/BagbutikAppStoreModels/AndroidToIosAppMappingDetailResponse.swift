import BagbutikCore
import Foundation

/**
 # AndroidToIosAppMappingDetailResponse

 A response that contains a single Android to iOS app mapping detail response resource.

 ```
 object AndroidToIosAppMappingDetailResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/androidtoiosappmappingdetailresponse>
 */
public struct AndroidToIosAppMappingDetailResponse: Codable, Sendable {
    public let data: AndroidToIosAppMappingDetail
    public let links: DocumentLinks

    public init(data: AndroidToIosAppMappingDetail,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AndroidToIosAppMappingDetail.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
