import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionLocalization
 The data structure that represent an App Store Version Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalization>
 */
public struct AppStoreVersionLocalization: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appStoreVersionLocalizations" }
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
        public var description: String?
        public var keywords: String?
        public var locale: String?
        public var marketingUrl: String?
        public var promotionalText: String?
        public var supportUrl: String?
        public var whatsNew: String?

        public init(description: String? = nil,
                    keywords: String? = nil,
                    locale: String? = nil,
                    marketingUrl: String? = nil,
                    promotionalText: String? = nil,
                    supportUrl: String? = nil,
                    whatsNew: String? = nil)
        {
            self.description = description
            self.keywords = keywords
            self.locale = locale
            self.marketingUrl = marketingUrl
            self.promotionalText = promotionalText
            self.supportUrl = supportUrl
            self.whatsNew = whatsNew
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            description = try container.decodeIfPresent(String.self, forKey: "description")
            keywords = try container.decodeIfPresent(String.self, forKey: "keywords")
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            marketingUrl = try container.decodeIfPresent(String.self, forKey: "marketingUrl")
            promotionalText = try container.decodeIfPresent(String.self, forKey: "promotionalText")
            supportUrl = try container.decodeIfPresent(String.self, forKey: "supportUrl")
            whatsNew = try container.decodeIfPresent(String.self, forKey: "whatsNew")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(description, forKey: "description")
            try container.encodeIfPresent(keywords, forKey: "keywords")
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(marketingUrl, forKey: "marketingUrl")
            try container.encodeIfPresent(promotionalText, forKey: "promotionalText")
            try container.encodeIfPresent(supportUrl, forKey: "supportUrl")
            try container.encodeIfPresent(whatsNew, forKey: "whatsNew")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var appPreviewSets: AppPreviewSets?
        public var appScreenshotSets: AppScreenshotSets?
        public var appStoreVersion: AppStoreVersion?

        public init(appPreviewSets: AppPreviewSets? = nil,
                    appScreenshotSets: AppScreenshotSets? = nil,
                    appStoreVersion: AppStoreVersion? = nil)
        {
            self.appPreviewSets = appPreviewSets
            self.appScreenshotSets = appScreenshotSets
            self.appStoreVersion = appStoreVersion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appPreviewSets = try container.decodeIfPresent(AppPreviewSets.self, forKey: "appPreviewSets")
            appScreenshotSets = try container.decodeIfPresent(AppScreenshotSets.self, forKey: "appScreenshotSets")
            appStoreVersion = try container.decodeIfPresent(AppStoreVersion.self, forKey: "appStoreVersion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appPreviewSets, forKey: "appPreviewSets")
            try container.encodeIfPresent(appScreenshotSets, forKey: "appScreenshotSets")
            try container.encodeIfPresent(appStoreVersion, forKey: "appStoreVersion")
        }

        public struct AppPreviewSets: Codable, Sendable {
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
                public var type: String { "appPreviewSets" }

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

        public struct AppScreenshotSets: Codable, Sendable {
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
                public var type: String { "appScreenshotSets" }

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
