import Foundation
import Bagbutik_Core

public struct SubscriptionPromotionalOfferUpdateRequest: Codable, RequestBody {
    public let data: Data
    public var included: [SubscriptionPromotionalOfferPriceInlineCreate]?

    public init(data: Data,
                included: [SubscriptionPromotionalOfferPriceInlineCreate]? = nil)
    {
        self.data = data
        self.included = included
    }

    public struct Data: Codable, Identifiable {
        public let id: String
        public var type: String { "subscriptionPromotionalOffers" }
        public var relationships: Relationships?

        public init(id: String,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case relationships
            case type
        }

        public struct Relationships: Codable {
            public var prices: Prices?

            public init(prices: Prices? = nil) {
                self.prices = prices
            }

            public struct Prices: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "subscriptionPromotionalOfferPrices" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encode(id, forKey: .id)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case id
                        case type
                    }
                }
            }
        }
    }
}
