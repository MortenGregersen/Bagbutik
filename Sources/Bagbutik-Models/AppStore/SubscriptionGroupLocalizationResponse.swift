import Bagbutik_Core
import Foundation

public struct SubscriptionGroupLocalizationResponse: Codable, Sendable {
    public let data: SubscriptionGroupLocalization
    public var included: [SubscriptionGroup]?
    public let links: DocumentLinks

    public init(data: SubscriptionGroupLocalization,
                included: [SubscriptionGroup]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionGroupLocalization.self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionGroup].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
