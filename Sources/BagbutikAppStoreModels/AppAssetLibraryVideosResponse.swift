import BagbutikCore
import Foundation

/**
 # AppAssetLibraryVideosResponse

 The response body for endpoints that list the video assets in an app’s asset library.

 ```
 object AppAssetLibraryVideosResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryvideosresponse>
 */
public struct AppAssetLibraryVideosResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppAssetLibraryVideo

    public let data: [AppAssetLibraryVideo]
    public var included: [AppAssetLibraryPlacement]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppAssetLibraryVideo],
                included: [AppAssetLibraryPlacement]? = nil,
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
        data = try container.decode([AppAssetLibraryVideo].self, forKey: "data")
        included = try container.decodeIfPresent([AppAssetLibraryPlacement].self, forKey: "included")
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

    public func getPlacements(for appAssetLibraryVideo: AppAssetLibraryVideo) -> [AppAssetLibraryPlacement] {
        guard let placementIds = appAssetLibraryVideo.relationships?.placements?.data?.map(\.id) else { return [] }
        return included?.filter { placementIds.contains($0.id) } ?? []
    }
}
