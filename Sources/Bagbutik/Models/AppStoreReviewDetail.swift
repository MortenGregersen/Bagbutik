import Foundation

public struct AppStoreReviewDetail: Codable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "appStoreReviewDetails" }
    public let attributes: Attributes?
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
        case relationships
    }

    public struct Attributes: Codable {
        public let contactEmail: String?
        public let contactFirstName: String?
        public let contactLastName: String?
        public let contactPhone: String?
        public let demoAccountName: String?
        public let demoAccountPassword: String?
        public let demoAccountRequired: Bool?
        public let notes: String?

        public init(contactEmail: String? = nil, contactFirstName: String? = nil, contactLastName: String? = nil, contactPhone: String? = nil, demoAccountName: String? = nil, demoAccountPassword: String? = nil, demoAccountRequired: Bool? = nil, notes: String? = nil) {
            self.contactEmail = contactEmail
            self.contactFirstName = contactFirstName
            self.contactLastName = contactLastName
            self.contactPhone = contactPhone
            self.demoAccountName = demoAccountName
            self.demoAccountPassword = demoAccountPassword
            self.demoAccountRequired = demoAccountRequired
            self.notes = notes
        }
    }

    public struct Relationships: Codable {
        public let appStoreReviewAttachments: AppStoreReviewAttachments?
        public let appStoreVersion: AppStoreVersion?

        public init(appStoreReviewAttachments: AppStoreReviewAttachments? = nil, appStoreVersion: AppStoreVersion? = nil) {
            self.appStoreReviewAttachments = appStoreReviewAttachments
            self.appStoreVersion = appStoreVersion
        }

        public struct AppStoreReviewAttachments: Codable {
            public let data: [Data]?
            public let links: Links?
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public struct Data: Codable {
                public let id: String
                public var type: String { "appStoreReviewAttachments" }

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
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            public struct Links: Codable {
                public let related: String?
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }

        public struct AppStoreVersion: Codable {
            public let data: Data?
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            public struct Data: Codable {
                public let id: String
                public var type: String { "appStoreVersions" }

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
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            public struct Links: Codable {
                public let related: String?
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
