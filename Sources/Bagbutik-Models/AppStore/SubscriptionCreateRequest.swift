import Bagbutik_Core
import Foundation

public struct SubscriptionCreateRequest: Codable, RequestBody {
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

    public struct Data: Codable {
        public var type: String { "subscriptions" }
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
            public var familySharable: Bool?
            public var groupLevel: Int?
            public let name: String
            public let productId: String
            public var reviewNote: String?
            public var subscriptionPeriod: Subscription.Attributes.SubscriptionPeriod?

            public init(familySharable: Bool? = nil,
                        groupLevel: Int? = nil,
                        name: String,
                        productId: String,
                        reviewNote: String? = nil,
                        subscriptionPeriod: Subscription.Attributes.SubscriptionPeriod? = nil)
            {
                self.familySharable = familySharable
                self.groupLevel = groupLevel
                self.name = name
                self.productId = productId
                self.reviewNote = reviewNote
                self.subscriptionPeriod = subscriptionPeriod
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                familySharable = try container.decodeIfPresent(Bool.self, forKey: .familySharable)
                groupLevel = try container.decodeIfPresent(Int.self, forKey: .groupLevel)
                name = try container.decode(String.self, forKey: .name)
                productId = try container.decode(String.self, forKey: .productId)
                reviewNote = try container.decodeIfPresent(String.self, forKey: .reviewNote)
                subscriptionPeriod = try container.decodeIfPresent(Subscription.Attributes.SubscriptionPeriod.self, forKey: .subscriptionPeriod)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(familySharable, forKey: .familySharable)
                try container.encodeIfPresent(groupLevel, forKey: .groupLevel)
                try container.encode(name, forKey: .name)
                try container.encode(productId, forKey: .productId)
                try container.encodeIfPresent(reviewNote, forKey: .reviewNote)
                try container.encodeIfPresent(subscriptionPeriod, forKey: .subscriptionPeriod)
            }

            private enum CodingKeys: String, CodingKey {
                case familySharable
                case groupLevel
                case name
                case productId
                case reviewNote
                case subscriptionPeriod
            }
        }

        public struct Relationships: Codable {
            public let group: Group

            public init(group: Group) {
                self.group = group
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                group = try container.decode(Group.self, forKey: .group)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(group, forKey: .group)
            }

            private enum CodingKeys: String, CodingKey {
                case group
            }

            public struct Group: Codable {
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
                    public var type: String { "subscriptionGroups" }

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
