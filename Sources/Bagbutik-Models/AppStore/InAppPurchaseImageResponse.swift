import Bagbutik_Core
import Foundation

/**
 # InAppPurchaseImageResponse
 A response that contains a single in-app purchase images resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseimageresponse>
 */
public struct InAppPurchaseImageResponse: Codable, Sendable {
    public let data: InAppPurchaseImage
    public var included: [InAppPurchaseV2]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseImage,
                included: [InAppPurchaseV2]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseImage.self, forKey: "data")
        included = try container.decodeIfPresent([InAppPurchaseV2].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
