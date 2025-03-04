import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppCategoryResponse
 A response that contains a single App Categories resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appcategoryresponse>
 */
public struct AppCategoryResponse: Codable, Sendable {
    public let data: AppCategory
    public var included: [AppCategory]?
    public let links: DocumentLinks

    public init(data: AppCategory,
                included: [AppCategory]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppCategory.self, forKey: "data")
        included = try container.decodeIfPresent([AppCategory].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
