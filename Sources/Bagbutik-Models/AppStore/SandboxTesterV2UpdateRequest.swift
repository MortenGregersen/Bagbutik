import Bagbutik_Core
import Foundation

public struct SandboxTesterV2UpdateRequest: Codable, Sendable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "sandboxTesters" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public var interruptPurchases: Bool?
            public var subscriptionRenewalRate: SandboxTesterV2.Attributes.SubscriptionRenewalRate?
            public var territory: TerritoryCode?

            public init(interruptPurchases: Bool? = nil,
                        subscriptionRenewalRate: SandboxTesterV2.Attributes.SubscriptionRenewalRate? = nil,
                        territory: TerritoryCode? = nil)
            {
                self.interruptPurchases = interruptPurchases
                self.subscriptionRenewalRate = subscriptionRenewalRate
                self.territory = territory
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                interruptPurchases = try container.decodeIfPresent(Bool.self, forKey: "interruptPurchases")
                subscriptionRenewalRate = try container.decodeIfPresent(SandboxTesterV2.Attributes.SubscriptionRenewalRate.self, forKey: "subscriptionRenewalRate")
                territory = try container.decodeIfPresent(TerritoryCode.self, forKey: "territory")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(interruptPurchases, forKey: "interruptPurchases")
                try container.encodeIfPresent(subscriptionRenewalRate, forKey: "subscriptionRenewalRate")
                try container.encodeIfPresent(territory, forKey: "territory")
            }
        }
    }
}
