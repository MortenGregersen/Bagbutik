import Bagbutik_Core
import Foundation

/**
 # AppStoreReviewAttachmentsResponse
 A response that contains a list of App Store Review Attachment resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachmentsresponse>
 */
public struct AppStoreReviewAttachmentsResponse: Codable, PagedResponse {
    public typealias Data = AppStoreReviewAttachment

    public let data: [AppStoreReviewAttachment]
    public var included: [AppStoreReviewDetail]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreReviewAttachment],
                included: [AppStoreReviewDetail]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([AppStoreReviewAttachment].self, forKey: .data)
        included = try container.decodeIfPresent([AppStoreReviewDetail].self, forKey: .included)
        links = try container.decode(PagedDocumentLinks.self, forKey: .links)
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(meta, forKey: .meta)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
        case meta
    }
}
