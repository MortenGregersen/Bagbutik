import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionGroupLocalizationV2Response
 The response body for endpoints that create, read, or modify a subscription group localization with the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptiongrouplocalizationv2response>
 */
public struct SubscriptionGroupLocalizationV2Response: Codable, Sendable {
    public let data: SubscriptionGroupLocalizationV2
    public var included: [SubscriptionGroupVersion]?
    public let links: DocumentLinks

    public init(data: SubscriptionGroupLocalizationV2,
                included: [SubscriptionGroupVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionGroupLocalizationV2.self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionGroupVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
