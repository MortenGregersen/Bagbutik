import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseOfferCodeOneTimeUseCodeResponse
 A response that contains a single in-app purchase offer code one-time use code resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseoffercodeonetimeusecoderesponse>
 */
public struct InAppPurchaseOfferCodeOneTimeUseCodeResponse: Codable, Sendable {
    public let data: InAppPurchaseOfferCodeOneTimeUseCode
    public var included: [Actor]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseOfferCodeOneTimeUseCode,
                included: [Actor]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseOfferCodeOneTimeUseCode.self, forKey: "data")
        included = try container.decodeIfPresent([Actor].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
