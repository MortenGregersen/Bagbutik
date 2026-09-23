import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # BuildBetaDetailResponse

 The response body for endpoints that read or modify beta testing details for a build.

 ```
 object BuildBetaDetailResponse
 ```

 ## See Also

 [`Read build beta detail information`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-buildBetaDetails-_id_)

 Get a specific build beta details resource.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailresponse>
 */
public struct BuildBetaDetailResponse: Codable, Sendable {
    public let data: BuildBetaDetail
    public var included: [Build]?
    public let links: DocumentLinks

    public init(data: BuildBetaDetail,
                included: [Build]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BuildBetaDetail.self, forKey: "data")
        included = try container.decodeIfPresent([Build].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
