import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # BuildBetaDetailsResponse

 The response body for endpoints that list beta testing details across builds.

 ```
 object BuildBetaDetailsResponse
 ```

 ## See Also

 [`List build beta details`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-buildBetaDetails)

 Find and list build beta details for all builds.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailsresponse>
 */
public struct BuildBetaDetailsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BuildBetaDetail

    public let data: [BuildBetaDetail]
    public var included: [Build]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BuildBetaDetail],
                included: [Build]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([BuildBetaDetail].self, forKey: "data")
        included = try container.decodeIfPresent([Build].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getBuild(for buildBetaDetail: BuildBetaDetail) -> Build? {
        included?.first { $0.id == buildBetaDetail.relationships?.build?.data?.id }
    }
}
