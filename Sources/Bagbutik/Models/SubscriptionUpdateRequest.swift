import Foundation

public struct SubscriptionUpdateRequest: Codable, RequestBody {
    public let data: Data
    public var included: [Included]?

    public init(data: Data, included: [Included]? = nil) {
        self.data = data
        self.included = included
    }

    public struct Data: Codable {
        public let id: String
        public var type: String { "subscriptions" }
        ///
        public let attributes: Attributes?
        ///
        public let relationships: Relationships?

        public init(id: String, attributes: Attributes? = nil, relationships: Relationships? = nil) {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
            case relationships
        }

        public struct Attributes: Codable {
            public var availableInAllTerritories: Bool?
            public var familySharable: Bool?
            public var groupLevel: Int?
            public var name: String?
            public var reviewNote: String?
            public var subscriptionPeriod: Subscription.Attributes.SubscriptionPeriod?

            public init(availableInAllTerritories: Bool? = nil, familySharable: Bool? = nil, groupLevel: Int? = nil, name: String? = nil, reviewNote: String? = nil, subscriptionPeriod: Subscription.Attributes.SubscriptionPeriod? = nil) {
                self.availableInAllTerritories = availableInAllTerritories
                self.familySharable = familySharable
                self.groupLevel = groupLevel
                self.name = name
                self.reviewNote = reviewNote
                self.subscriptionPeriod = subscriptionPeriod
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionupdaterequest/properties/data/properties/relationships>
         */
        public struct Relationships: Codable {
            public var introductoryOffers: IntroductoryOffers?
            public var prices: Prices?
            public var promotionalOffers: PromotionalOffers?

            public init(introductoryOffers: IntroductoryOffers? = nil, prices: Prices? = nil, promotionalOffers: PromotionalOffers? = nil) {
                self.introductoryOffers = introductoryOffers
                self.prices = prices
                self.promotionalOffers = promotionalOffers
            }

            public struct IntroductoryOffers: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionupdaterequest/properties/data/properties/relationships/properties/introductoryoffers/properties/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "subscriptionIntroductoryOffers" }

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

            public struct Prices: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionupdaterequest/properties/data/properties/relationships/properties/prices/properties/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "subscriptionPrices" }

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

            public struct PromotionalOffers: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionupdaterequest/properties/data/properties/relationships/properties/promotionaloffers/properties/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "subscriptionPromotionalOffers" }

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

    public enum Included: Codable {
        case subscriptionIntroductoryOfferInlineCreate(SubscriptionIntroductoryOfferInlineCreate)
        case subscriptionPriceInlineCreate(SubscriptionPriceInlineCreate)
        case subscriptionPromotionalOfferInlineCreate(SubscriptionPromotionalOfferInlineCreate)

        public init(from decoder: Decoder) throws {
            if let subscriptionIntroductoryOfferInlineCreate = try? SubscriptionIntroductoryOfferInlineCreate(from: decoder) {
                self = .subscriptionIntroductoryOfferInlineCreate(subscriptionIntroductoryOfferInlineCreate)
            } else if let subscriptionPriceInlineCreate = try? SubscriptionPriceInlineCreate(from: decoder) {
                self = .subscriptionPriceInlineCreate(subscriptionPriceInlineCreate)
            } else if let subscriptionPromotionalOfferInlineCreate = try? SubscriptionPromotionalOfferInlineCreate(from: decoder) {
                self = .subscriptionPromotionalOfferInlineCreate(subscriptionPromotionalOfferInlineCreate)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .subscriptionIntroductoryOfferInlineCreate(value):
                try value.encode(to: encoder)
            case let .subscriptionPriceInlineCreate(value):
                try value.encode(to: encoder)
            case let .subscriptionPromotionalOfferInlineCreate(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
