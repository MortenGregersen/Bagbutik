import Bagbutik_Core
import Foundation

public struct AppStoreReviewDetail: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appStoreReviewDetails" }
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
        public var contactEmail: String?
        public var contactFirstName: String?
        public var contactLastName: String?
        public var contactPhone: String?
        public var demoAccountName: String?
        public var demoAccountPassword: String?
        public var demoAccountRequired: Bool?
        public var notes: String?

        public init(contactEmail: String? = nil,
                    contactFirstName: String? = nil,
                    contactLastName: String? = nil,
                    contactPhone: String? = nil,
                    demoAccountName: String? = nil,
                    demoAccountPassword: String? = nil,
                    demoAccountRequired: Bool? = nil,
                    notes: String? = nil)
        {
            self.contactEmail = contactEmail
            self.contactFirstName = contactFirstName
            self.contactLastName = contactLastName
            self.contactPhone = contactPhone
            self.demoAccountName = demoAccountName
            self.demoAccountPassword = demoAccountPassword
            self.demoAccountRequired = demoAccountRequired
            self.notes = notes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            contactEmail = try container.decodeIfPresent(String.self, forKey: "contactEmail")
            contactFirstName = try container.decodeIfPresent(String.self, forKey: "contactFirstName")
            contactLastName = try container.decodeIfPresent(String.self, forKey: "contactLastName")
            contactPhone = try container.decodeIfPresent(String.self, forKey: "contactPhone")
            demoAccountName = try container.decodeIfPresent(String.self, forKey: "demoAccountName")
            demoAccountPassword = try container.decodeIfPresent(String.self, forKey: "demoAccountPassword")
            demoAccountRequired = try container.decodeIfPresent(Bool.self, forKey: "demoAccountRequired")
            notes = try container.decodeIfPresent(String.self, forKey: "notes")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(contactEmail, forKey: "contactEmail")
            try container.encodeIfPresent(contactFirstName, forKey: "contactFirstName")
            try container.encodeIfPresent(contactLastName, forKey: "contactLastName")
            try container.encodeIfPresent(contactPhone, forKey: "contactPhone")
            try container.encodeIfPresent(demoAccountName, forKey: "demoAccountName")
            try container.encodeIfPresent(demoAccountPassword, forKey: "demoAccountPassword")
            try container.encodeIfPresent(demoAccountRequired, forKey: "demoAccountRequired")
            try container.encodeIfPresent(notes, forKey: "notes")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var appStoreReviewAttachments: AppStoreReviewAttachments?
        public var appStoreVersion: AppStoreVersion?

        public init(appStoreReviewAttachments: AppStoreReviewAttachments? = nil,
                    appStoreVersion: AppStoreVersion? = nil)
        {
            self.appStoreReviewAttachments = appStoreReviewAttachments
            self.appStoreVersion = appStoreVersion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appStoreReviewAttachments = try container.decodeIfPresent(AppStoreReviewAttachments.self, forKey: "appStoreReviewAttachments")
            appStoreVersion = try container.decodeIfPresent(AppStoreVersion.self, forKey: "appStoreVersion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appStoreReviewAttachments, forKey: "appStoreReviewAttachments")
            try container.encodeIfPresent(appStoreVersion, forKey: "appStoreVersion")
        }

        public struct AppStoreReviewAttachments: Codable, Sendable {
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
                public var type: String { "appStoreReviewAttachments" }

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

        public struct AppStoreVersion: Codable, Sendable {
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
                public var type: String { "appStoreVersions" }

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
