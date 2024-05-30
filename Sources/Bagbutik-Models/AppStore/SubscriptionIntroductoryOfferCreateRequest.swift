import Bagbutik_Core
import Foundation

public struct SubscriptionIntroductoryOfferCreateRequest: Codable, RequestBody {
    public let data: Data
    public var included: [SubscriptionPricePointInlineCreate]?

    public init(data: Data,
                included: [SubscriptionPricePointInlineCreate]? = nil)
    {
        self.data = data
        self.included = included
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Data.self, forKey: .data)
        included = try container.decodeIfPresent([SubscriptionPricePointInlineCreate].self, forKey: .included)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
    }

    public struct Data: Codable {
        public var type: String { "subscriptionIntroductoryOffers" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
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
            case attributes
            case relationships
            case type
        }

        public struct Attributes: Codable {
            public let duration: SubscriptionOfferDuration
            public var endDate: String?
            public let numberOfPeriods: Int
            public let offerMode: SubscriptionOfferMode
            public var startDate: String?

            public init(duration: SubscriptionOfferDuration,
                        endDate: String? = nil,
                        numberOfPeriods: Int,
                        offerMode: SubscriptionOfferMode,
                        startDate: String? = nil)
            {
                self.duration = duration
                self.endDate = endDate
                self.numberOfPeriods = numberOfPeriods
                self.offerMode = offerMode
                self.startDate = startDate
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                duration = try container.decode(SubscriptionOfferDuration.self, forKey: .duration)
                endDate = try container.decodeIfPresent(String.self, forKey: .endDate)
                numberOfPeriods = try container.decode(Int.self, forKey: .numberOfPeriods)
                offerMode = try container.decode(SubscriptionOfferMode.self, forKey: .offerMode)
                startDate = try container.decodeIfPresent(String.self, forKey: .startDate)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(duration, forKey: .duration)
                try container.encodeIfPresent(endDate, forKey: .endDate)
                try container.encode(numberOfPeriods, forKey: .numberOfPeriods)
                try container.encode(offerMode, forKey: .offerMode)
                try container.encodeIfPresent(startDate, forKey: .startDate)
            }

            private enum CodingKeys: String, CodingKey {
                case duration
                case endDate
                case numberOfPeriods
                case offerMode
                case startDate
            }
        }

        public struct Relationships: Codable {
            public let subscription: Subscription
            public var subscriptionPricePoint: SubscriptionPricePoint?
            public var territory: Territory?

            public init(subscription: Subscription,
                        subscriptionPricePoint: SubscriptionPricePoint? = nil,
                        territory: Territory? = nil)
            {
                self.subscription = subscription
                self.subscriptionPricePoint = subscriptionPricePoint
                self.territory = territory
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                subscription = try container.decode(Subscription.self, forKey: .subscription)
                subscriptionPricePoint = try container.decodeIfPresent(SubscriptionPricePoint.self, forKey: .subscriptionPricePoint)
                territory = try container.decodeIfPresent(Territory.self, forKey: .territory)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(subscription, forKey: .subscription)
                try container.encodeIfPresent(subscriptionPricePoint, forKey: .subscriptionPricePoint)
                try container.encodeIfPresent(territory, forKey: .territory)
            }

            private enum CodingKeys: String, CodingKey {
                case subscription
                case subscriptionPricePoint
                case territory
            }

            public struct Subscription: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decode(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
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

            public struct SubscriptionPricePoint: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
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

            public struct Territory: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
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
}
