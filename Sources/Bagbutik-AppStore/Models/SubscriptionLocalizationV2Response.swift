import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionLocalizationV2Response
 The response body for endpoints that create, read, or modify a subscription localization with the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionlocalizationv2response>
 */
public struct SubscriptionLocalizationV2Response: Codable, Sendable {
    public let data: SubscriptionLocalizationV2
    public var included: [SubscriptionVersion]?
    public let links: DocumentLinks

    public init(data: SubscriptionLocalizationV2,
                included: [SubscriptionVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionLocalizationV2.self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
