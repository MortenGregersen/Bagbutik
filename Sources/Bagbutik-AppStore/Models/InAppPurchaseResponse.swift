import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseResponse
 A response that contains a single In-App Purchases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseresponse>
 */
public struct InAppPurchaseResponse: Codable, Sendable {
    public let data: InAppPurchase
    public var included: [App]?
    public let links: DocumentLinks

    public init(data: InAppPurchase,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchase.self, forKey: "data")
        included = try container.decodeIfPresent([App].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
