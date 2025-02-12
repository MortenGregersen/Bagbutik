import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct InAppPurchaseLocalizationResponse: Codable, Sendable {
    public let data: InAppPurchaseLocalization
    public var included: [InAppPurchaseV2]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseLocalization,
                included: [InAppPurchaseV2]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseLocalization.self, forKey: "data")
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
