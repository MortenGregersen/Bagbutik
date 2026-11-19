import BagbutikCore
import Foundation

/**
 # SubscriptionPriceTierInlineCreate

 A volume pricing tier that you create inline with a subscription price.

 ```
 object SubscriptionPriceTierInlineCreate
 ```

 ## Topics

 ### Objects

 [`object SubscriptionPriceTierInlineCreate.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/SubscriptionPriceTierInlineCreate/Attributes-data.dictionary)

 The attributes you include in the request.

 [`object SubscriptionPriceTierInlineCreate.Relationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/SubscriptionPriceTierInlineCreate/Relationships-data.dictionary)

 The relationships to other resources that you can set with this request.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionpricetierinlinecreate>
 */
public struct SubscriptionPriceTierInlineCreate: Codable, Sendable, Identifiable {
    public var id: String?
    public var type: String { "subscriptionPriceTiers" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decodeIfPresent(String.self, forKey: "id")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(id, forKey: "id")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var minQuantity: Int?

        public init(minQuantity: Int? = nil) {
            self.minQuantity = minQuantity
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            minQuantity = try container.decodeIfPresent(Int.self, forKey: "minQuantity")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(minQuantity, forKey: "minQuantity")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var subscriptionPricePoint: SubscriptionPricePoint?

        public init(subscriptionPricePoint: SubscriptionPricePoint? = nil) {
            self.subscriptionPricePoint = subscriptionPricePoint
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            subscriptionPricePoint = try container.decodeIfPresent(SubscriptionPricePoint.self, forKey: "subscriptionPricePoint")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(subscriptionPricePoint, forKey: "subscriptionPricePoint")
        }

        public struct SubscriptionPricePoint: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
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
