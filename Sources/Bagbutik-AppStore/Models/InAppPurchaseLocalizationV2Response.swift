import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseLocalizationV2Response
 The response body for endpoints that create, read, or modify an in-app purchase localization with the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaselocalizationv2response>
 */
public struct InAppPurchaseLocalizationV2Response: Codable, Sendable {
    public let data: InAppPurchaseLocalizationV2
    public var included: [InAppPurchaseVersion]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseLocalizationV2,
                included: [InAppPurchaseVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseLocalizationV2.self, forKey: "data")
        included = try container.decodeIfPresent([InAppPurchaseVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
