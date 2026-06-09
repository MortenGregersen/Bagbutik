import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionPlanAvailabilitiesResponse
 The response body for endpoints that list subscription plan availabilities.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionplanavailabilitiesresponse>
 */
public struct SubscriptionPlanAvailabilitiesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionPlanAvailability

    public let data: [SubscriptionPlanAvailability]
    public var included: [Territory]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionPlanAvailability],
                included: [Territory]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([SubscriptionPlanAvailability].self, forKey: "data")
        included = try container.decodeIfPresent([Territory].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getAvailableTerritories(for subscriptionPlanAvailability: SubscriptionPlanAvailability) -> [Territory] {
        guard let availableTerritoryIds = subscriptionPlanAvailability.relationships?.availableTerritories?.data?.map(\.id) else { return [] }
        return included?.filter { availableTerritoryIds.contains($0.id) } ?? []
    }
}
