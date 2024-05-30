import Bagbutik_Core
import Foundation

public struct SubscriptionOfferCodeCustomCode: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "subscriptionOfferCodeCustomCodes" }
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    public struct Attributes: Codable {
        public var active: Bool?
        public var createdDate: Date?
        public var customCode: String?
        public var expirationDate: String?
        public var numberOfCodes: Int?

        public init(active: Bool? = nil,
                    createdDate: Date? = nil,
                    customCode: String? = nil,
                    expirationDate: String? = nil,
                    numberOfCodes: Int? = nil)
        {
            self.active = active
            self.createdDate = createdDate
            self.customCode = customCode
            self.expirationDate = expirationDate
            self.numberOfCodes = numberOfCodes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            active = try container.decodeIfPresent(Bool.self, forKey: .active)
            createdDate = try container.decodeIfPresent(Date.self, forKey: .createdDate)
            customCode = try container.decodeIfPresent(String.self, forKey: .customCode)
            expirationDate = try container.decodeIfPresent(String.self, forKey: .expirationDate)
            numberOfCodes = try container.decodeIfPresent(Int.self, forKey: .numberOfCodes)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(active, forKey: .active)
            try container.encodeIfPresent(createdDate, forKey: .createdDate)
            try container.encodeIfPresent(customCode, forKey: .customCode)
            try container.encodeIfPresent(expirationDate, forKey: .expirationDate)
            try container.encodeIfPresent(numberOfCodes, forKey: .numberOfCodes)
        }

        private enum CodingKeys: String, CodingKey {
            case active
            case createdDate
            case customCode
            case expirationDate
            case numberOfCodes
        }
    }

    public struct Relationships: Codable {
        public var offerCode: OfferCode?

        public init(offerCode: OfferCode? = nil) {
            self.offerCode = offerCode
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            offerCode = try container.decodeIfPresent(OfferCode.self, forKey: .offerCode)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(offerCode, forKey: .offerCode)
        }

        private enum CodingKeys: String, CodingKey {
            case offerCode
        }

        public struct OfferCode: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "subscriptionOfferCodes" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
