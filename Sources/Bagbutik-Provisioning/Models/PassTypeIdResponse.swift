import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # PassTypeIdResponse
 A response that contains a single pass type id response resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/passtypeidresponse>
 */
public struct PassTypeIdResponse: Codable, Sendable {
    public let data: PassTypeId
    public var included: [Certificate]?
    public let links: DocumentLinks

    public init(data: PassTypeId,
                included: [Certificate]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(PassTypeId.self, forKey: "data")
        included = try container.decodeIfPresent([Certificate].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
