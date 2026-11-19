import BagbutikCore
import Foundation

/**
 # SubscriptionPriceTierEqualization

 The equalized volume pricing tiers for each territory, calculated from a base territory’s tiers.

 ```
 object SubscriptionPriceTierEqualization
 ```

 ## Topics

 ### Objects

 [`object SubscriptionPriceTierEqualization.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/SubscriptionPriceTierEqualization/Attributes-data.dictionary)

 Attributes that describe a subscription price tier equalization resource.

 [`object SubscriptionPriceTierEqualization.Relationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/SubscriptionPriceTierEqualization/Relationships-data.dictionary)

 The relationships you include in the request and those on which you can operate.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionpricetierequalization>
 */
public struct SubscriptionPriceTierEqualization: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "subscriptionPriceTierEqualizations" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
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
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var equalizedPrices: [SubscriptionEqualizedPriceTiersForTerritory]?

        public init(equalizedPrices: [SubscriptionEqualizedPriceTiersForTerritory]? = nil) {
            self.equalizedPrices = equalizedPrices
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            equalizedPrices = try container.decodeIfPresent([SubscriptionEqualizedPriceTiersForTerritory].self, forKey: "equalizedPrices")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(equalizedPrices, forKey: "equalizedPrices")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var priceTierPricePoints: PriceTierPricePoints?

        public init(priceTierPricePoints: PriceTierPricePoints? = nil) {
            self.priceTierPricePoints = priceTierPricePoints
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            priceTierPricePoints = try container.decodeIfPresent(PriceTierPricePoints.self, forKey: "priceTierPricePoints")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(priceTierPricePoints, forKey: "priceTierPricePoints")
        }

        public struct PriceTierPricePoints: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "subscriptionPricePoints" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }
    }
}
