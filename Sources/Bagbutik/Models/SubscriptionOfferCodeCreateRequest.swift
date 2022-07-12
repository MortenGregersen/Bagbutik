import Foundation

public struct SubscriptionOfferCodeCreateRequest: Codable, RequestBody {
    public let data: Data
    public var included: [SubscriptionOfferCodePriceInlineCreate]?

    public init(data: Data, included: [SubscriptionOfferCodePriceInlineCreate]? = nil) {
        self.data = data
        self.included = included
    }

    public struct Data: Codable {
        public var type: String { "subscriptionOfferCodes" }
        ///
        public let attributes: Attributes
        ///
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
            case relationships
        }

        public struct Attributes: Codable {
            public let customerEligibilities: [SubscriptionCustomerEligibility]
            public let duration: SubscriptionOfferDuration
            public let name: String
            public let numberOfPeriods: Int
            public let offerEligibility: SubscriptionOfferEligibility
            public let offerMode: SubscriptionOfferMode

            public init(customerEligibilities: [SubscriptionCustomerEligibility], duration: SubscriptionOfferDuration, name: String, numberOfPeriods: Int, offerEligibility: SubscriptionOfferEligibility, offerMode: SubscriptionOfferMode) {
                self.customerEligibilities = customerEligibilities
                self.duration = duration
                self.name = name
                self.numberOfPeriods = numberOfPeriods
                self.offerEligibility = offerEligibility
                self.offerMode = offerMode
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionoffercodecreaterequest/properties/data/properties/relationships>
         */
        public struct Relationships: Codable {
            public let prices: Prices
            public let subscription: Subscription

            public init(prices: Prices, subscription: Subscription) {
                self.prices = prices
                self.subscription = subscription
            }

            public struct Prices: Codable {
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionoffercodecreaterequest/properties/data/properties/relationships/properties/prices/properties/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "subscriptionOfferCodePrices" }

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

            public struct Subscription: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionoffercodecreaterequest/properties/data/properties/relationships/properties/subscription/properties/data>
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
        }
    }
}
