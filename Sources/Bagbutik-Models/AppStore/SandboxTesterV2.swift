import Bagbutik_Core
import Foundation

public struct SandboxTesterV2: Codable, Identifiable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "sandboxTesters" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    public struct Attributes: Codable {
        public var acAccountName: String?
        public var applePayCompatible: Bool?
        public var firstName: String?
        public var interruptPurchases: Bool?
        public var lastName: String?
        public var subscriptionRenewalRate: SubscriptionRenewalRate?
        public var territory: TerritoryCode?

        public init(acAccountName: String? = nil,
                    applePayCompatible: Bool? = nil,
                    firstName: String? = nil,
                    interruptPurchases: Bool? = nil,
                    lastName: String? = nil,
                    subscriptionRenewalRate: SubscriptionRenewalRate? = nil,
                    territory: TerritoryCode? = nil)
        {
            self.acAccountName = acAccountName
            self.applePayCompatible = applePayCompatible
            self.firstName = firstName
            self.interruptPurchases = interruptPurchases
            self.lastName = lastName
            self.subscriptionRenewalRate = subscriptionRenewalRate
            self.territory = territory
        }

        public enum SubscriptionRenewalRate: String, Codable, CaseIterable {
            case monthlyRenewalEveryOneHour = "MONTHLY_RENEWAL_EVERY_ONE_HOUR"
            case monthlyRenewalEveryThirtyMinutes = "MONTHLY_RENEWAL_EVERY_THIRTY_MINUTES"
            case monthlyRenewalEveryFifteenMinutes = "MONTHLY_RENEWAL_EVERY_FIFTEEN_MINUTES"
            case monthlyRenewalEveryFiveMinutes = "MONTHLY_RENEWAL_EVERY_FIVE_MINUTES"
            case monthlyRenewalEveryThreeMinutes = "MONTHLY_RENEWAL_EVERY_THREE_MINUTES"
        }
    }
}
