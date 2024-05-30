import Bagbutik_Core
import Foundation

/**
 # AppScreenshotsResponse
 A response that contains a list of App Screenshots resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotsresponse>
 */
public struct AppScreenshotsResponse: Codable, PagedResponse {
    public typealias Data = AppScreenshot

    public let data: [AppScreenshot]
    public var included: [AppScreenshotSet]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppScreenshot],
                included: [AppScreenshotSet]? = nil,
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
        data = try container.decode([AppScreenshot].self, forKey: "data")
        included = try container.decodeIfPresent([AppScreenshotSet].self, forKey: "included")
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
}
