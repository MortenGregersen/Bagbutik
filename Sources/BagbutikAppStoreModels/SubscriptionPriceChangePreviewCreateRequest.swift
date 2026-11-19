import BagbutikCore
import Foundation

/**
 # SubscriptionPriceChangePreviewCreateRequest

 The request body you use to create a subscription price change preview.

 ```
 object SubscriptionPriceChangePreviewCreateRequest
 ```

 ## Topics

 ### Objects

 [`object SubscriptionPriceChangePreviewCreateRequest.Data`](https://developer.apple.com/documentation/AppStoreConnectAPI/SubscriptionPriceChangePreviewCreateRequest/Data-data.dictionary)

 The data element of the request body.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionpricechangepreviewcreaterequest>
 */
public struct SubscriptionPriceChangePreviewCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "subscriptionPriceChangePreviews" }
        public var attributes: Attributes?
        public let relationships: Relationships

        public init(attributes: Attributes? = nil,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public var proposedChanges: [ProposedChanges]?

            public init(proposedChanges: [ProposedChanges]? = nil) {
                self.proposedChanges = proposedChanges
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                proposedChanges = try container.decodeIfPresent([ProposedChanges].self, forKey: "proposedChanges")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(proposedChanges, forKey: "proposedChanges")
            }

            public struct ProposedChanges: Codable, Sendable {
                public var additionalPriceTiers: [ProposedSubscriptionPriceTier]?
                public var basePricePointId: String?
                public var startDate: String?
                public var territoryId: String?

                public init(additionalPriceTiers: [ProposedSubscriptionPriceTier]? = nil,
                            basePricePointId: String? = nil,
                            startDate: String? = nil,
                            territoryId: String? = nil)
                {
                    self.additionalPriceTiers = additionalPriceTiers
                    self.basePricePointId = basePricePointId
                    self.startDate = startDate
                    self.territoryId = territoryId
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    additionalPriceTiers = try container.decodeIfPresent([ProposedSubscriptionPriceTier].self, forKey: "additionalPriceTiers")
                    basePricePointId = try container.decodeIfPresent(String.self, forKey: "basePricePointId")
                    startDate = try container.decodeIfPresent(String.self, forKey: "startDate")
                    territoryId = try container.decodeIfPresent(String.self, forKey: "territoryId")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(additionalPriceTiers, forKey: "additionalPriceTiers")
                    try container.encodeIfPresent(basePricePointId, forKey: "basePricePointId")
                    try container.encodeIfPresent(startDate, forKey: "startDate")
                    try container.encodeIfPresent(territoryId, forKey: "territoryId")
                }
            }
        }

        public struct Relationships: Codable, Sendable {
            public let subscription: Subscription

            public init(subscription: Subscription) {
                self.subscription = subscription
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                subscription = try container.decode(Subscription.self, forKey: "subscription")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(subscription, forKey: "subscription")
            }

            public struct Subscription: Codable, Sendable {
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
                    public var type: String { "subscriptions" }

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
}
