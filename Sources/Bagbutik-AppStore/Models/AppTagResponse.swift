import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppTagResponse
 A response that contains a single app tag response resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apptagresponse>
 */
public struct AppTagResponse: Codable, Sendable {
    public let data: AppTag
    public var included: [Territory]?
    public let links: DocumentLinks

    public init(data: AppTag,
                included: [Territory]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppTag.self, forKey: "data")
        included = try container.decodeIfPresent([Territory].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
