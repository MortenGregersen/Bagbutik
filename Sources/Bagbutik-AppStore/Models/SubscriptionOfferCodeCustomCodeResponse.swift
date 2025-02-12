import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct SubscriptionOfferCodeCustomCodeResponse: Codable, Sendable {
    public let data: SubscriptionOfferCodeCustomCode
    public var included: [SubscriptionOfferCode]?
    public let links: DocumentLinks

    public init(data: SubscriptionOfferCodeCustomCode,
                included: [SubscriptionOfferCode]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionOfferCodeCustomCode.self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionOfferCode].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
