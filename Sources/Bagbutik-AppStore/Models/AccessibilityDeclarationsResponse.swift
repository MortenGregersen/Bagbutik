import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AccessibilityDeclarationsResponse
 A response that contains a list of accessibility declaration resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/accessibilitydeclarationsresponse>
 */
public struct AccessibilityDeclarationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AccessibilityDeclaration

    public let data: [AccessibilityDeclaration]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AccessibilityDeclaration],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AccessibilityDeclaration].self, forKey: "data")
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
