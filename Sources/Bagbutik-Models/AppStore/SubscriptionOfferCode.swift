import Bagbutik_Core
import Foundation

public struct SubscriptionOfferCode: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "subscriptionOfferCodes" }
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
        public var active: Bool?
        public var customerEligibilities: [SubscriptionCustomerEligibility]?
        public var duration: SubscriptionOfferDuration?
        public var name: String?
        public var numberOfPeriods: Int?
        public var offerEligibility: SubscriptionOfferEligibility?
        public var offerMode: SubscriptionOfferMode?
        public var totalNumberOfCodes: Int?

        public init(active: Bool? = nil,
                    customerEligibilities: [SubscriptionCustomerEligibility]? = nil,
                    duration: SubscriptionOfferDuration? = nil,
                    name: String? = nil,
                    numberOfPeriods: Int? = nil,
                    offerEligibility: SubscriptionOfferEligibility? = nil,
                    offerMode: SubscriptionOfferMode? = nil,
                    totalNumberOfCodes: Int? = nil)
        {
            self.active = active
            self.customerEligibilities = customerEligibilities
            self.duration = duration
            self.name = name
            self.numberOfPeriods = numberOfPeriods
            self.offerEligibility = offerEligibility
            self.offerMode = offerMode
            self.totalNumberOfCodes = totalNumberOfCodes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            active = try container.decodeIfPresent(Bool.self, forKey: "active")
            customerEligibilities = try container.decodeIfPresent([SubscriptionCustomerEligibility].self, forKey: "customerEligibilities")
            duration = try container.decodeIfPresent(SubscriptionOfferDuration.self, forKey: "duration")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            numberOfPeriods = try container.decodeIfPresent(Int.self, forKey: "numberOfPeriods")
            offerEligibility = try container.decodeIfPresent(SubscriptionOfferEligibility.self, forKey: "offerEligibility")
            offerMode = try container.decodeIfPresent(SubscriptionOfferMode.self, forKey: "offerMode")
            totalNumberOfCodes = try container.decodeIfPresent(Int.self, forKey: "totalNumberOfCodes")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(active, forKey: "active")
            try container.encodeIfPresent(customerEligibilities, forKey: "customerEligibilities")
            try container.encodeIfPresent(duration, forKey: "duration")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(numberOfPeriods, forKey: "numberOfPeriods")
            try container.encodeIfPresent(offerEligibility, forKey: "offerEligibility")
            try container.encodeIfPresent(offerMode, forKey: "offerMode")
            try container.encodeIfPresent(totalNumberOfCodes, forKey: "totalNumberOfCodes")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var customCodes: CustomCodes?
        public var oneTimeUseCodes: OneTimeUseCodes?
        public var prices: Prices?
        public var subscription: Subscription?

        public init(customCodes: CustomCodes? = nil,
                    oneTimeUseCodes: OneTimeUseCodes? = nil,
                    prices: Prices? = nil,
                    subscription: Subscription? = nil)
        {
            self.customCodes = customCodes
            self.oneTimeUseCodes = oneTimeUseCodes
            self.prices = prices
            self.subscription = subscription
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            customCodes = try container.decodeIfPresent(CustomCodes.self, forKey: "customCodes")
            oneTimeUseCodes = try container.decodeIfPresent(OneTimeUseCodes.self, forKey: "oneTimeUseCodes")
            prices = try container.decodeIfPresent(Prices.self, forKey: "prices")
            subscription = try container.decodeIfPresent(Subscription.self, forKey: "subscription")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(customCodes, forKey: "customCodes")
            try container.encodeIfPresent(oneTimeUseCodes, forKey: "oneTimeUseCodes")
            try container.encodeIfPresent(prices, forKey: "prices")
            try container.encodeIfPresent(subscription, forKey: "subscription")
        }

        public struct CustomCodes: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "subscriptionOfferCodeCustomCodes" }

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

        public struct OneTimeUseCodes: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "subscriptionOfferCodeOneTimeUseCodes" }

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

        public struct Prices: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "subscriptionOfferCodePrices" }

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

        public struct Subscription: Codable, Sendable {
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
