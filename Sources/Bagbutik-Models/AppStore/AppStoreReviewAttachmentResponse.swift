import Bagbutik_Core
import Foundation

/**
 # AppStoreReviewAttachmentResponse
 A response that contains a single App Store Review Attachments resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachmentresponse>
 */
public struct AppStoreReviewAttachmentResponse: Codable {
    public let data: AppStoreReviewAttachment
    public var included: [AppStoreReviewDetail]?
    public let links: DocumentLinks

    public init(data: AppStoreReviewAttachment,
                included: [AppStoreReviewDetail]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(AppStoreReviewAttachment.self, forKey: .data)
        included = try container.decodeIfPresent([AppStoreReviewDetail].self, forKey: .included)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
    }
}
