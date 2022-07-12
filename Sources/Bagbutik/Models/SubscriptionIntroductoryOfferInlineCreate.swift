import Foundation

public struct SubscriptionIntroductoryOfferInlineCreate: Codable {
    public var id: String?
    public var type: String { "subscriptionIntroductoryOffers" }
    ///
    public let attributes: Attributes
    ///
    public let relationships: Relationships?

    public init(id: String? = nil, attributes: Attributes, relationships: Relationships? = nil) {
        self.id = id
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        attributes = try container.decode(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
        case relationships
    }

    public struct Attributes: Codable {
        public let duration: SubscriptionOfferDuration
        public var endDate: String?
        public let numberOfPeriods: Int
        public let offerMode: SubscriptionOfferMode
        public var startDate: String?

        public init(duration: SubscriptionOfferDuration, endDate: String? = nil, numberOfPeriods: Int, offerMode: SubscriptionOfferMode, startDate: String? = nil) {
            self.duration = duration
            self.endDate = endDate
            self.numberOfPeriods = numberOfPeriods
            self.offerMode = offerMode
            self.startDate = startDate
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionintroductoryofferinlinecreate/relationships>
     */
    public struct Relationships: Codable {
        public var subscription: Subscription?
        public var subscriptionPricePoint: SubscriptionPricePoint?
        public var territory: Territory?

        public init(subscription: Subscription? = nil, subscriptionPricePoint: SubscriptionPricePoint? = nil, territory: Territory? = nil) {
            self.subscription = subscription
            self.subscriptionPricePoint = subscriptionPricePoint
            self.territory = territory
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionintroductoryofferinlinecreate/relationships/subscription>
         */
        public struct Subscription: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionintroductoryofferinlinecreate/relationships/subscription/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "subscriptions" }

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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionintroductoryofferinlinecreate/relationships/subscriptionpricepoint>
         */
        public struct SubscriptionPricePoint: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionintroductoryofferinlinecreate/relationships/subscriptionpricepoint/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "subscriptionPricePoints" }

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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionintroductoryofferinlinecreate/relationships/territory>
         */
        public struct Territory: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionintroductoryofferinlinecreate/relationships/territory/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "territories" }

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
