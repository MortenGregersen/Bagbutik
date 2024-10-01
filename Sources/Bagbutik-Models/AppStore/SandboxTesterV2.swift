import Bagbutik_Core
import Foundation

public struct SandboxTesterV2: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "sandboxTesters" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            acAccountName = try container.decodeIfPresent(String.self, forKey: "acAccountName")
            applePayCompatible = try container.decodeIfPresent(Bool.self, forKey: "applePayCompatible")
            firstName = try container.decodeIfPresent(String.self, forKey: "firstName")
            interruptPurchases = try container.decodeIfPresent(Bool.self, forKey: "interruptPurchases")
            lastName = try container.decodeIfPresent(String.self, forKey: "lastName")
            subscriptionRenewalRate = try container.decodeIfPresent(SubscriptionRenewalRate.self, forKey: "subscriptionRenewalRate")
            territory = try container.decodeIfPresent(TerritoryCode.self, forKey: "territory")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(acAccountName, forKey: "acAccountName")
            try container.encodeIfPresent(applePayCompatible, forKey: "applePayCompatible")
            try container.encodeIfPresent(firstName, forKey: "firstName")
            try container.encodeIfPresent(interruptPurchases, forKey: "interruptPurchases")
            try container.encodeIfPresent(lastName, forKey: "lastName")
            try container.encodeIfPresent(subscriptionRenewalRate, forKey: "subscriptionRenewalRate")
            try container.encodeIfPresent(territory, forKey: "territory")
        }

        public enum SubscriptionRenewalRate: String, Sendable, Codable, CaseIterable {
            case monthlyRenewalEveryFifteenMinutes = "MONTHLY_RENEWAL_EVERY_FIFTEEN_MINUTES"
            case monthlyRenewalEveryFiveMinutes = "MONTHLY_RENEWAL_EVERY_FIVE_MINUTES"
            case monthlyRenewalEveryOneHour = "MONTHLY_RENEWAL_EVERY_ONE_HOUR"
            case monthlyRenewalEveryThirtyMinutes = "MONTHLY_RENEWAL_EVERY_THIRTY_MINUTES"
            case monthlyRenewalEveryThreeMinutes = "MONTHLY_RENEWAL_EVERY_THREE_MINUTES"
        }
    }
}
