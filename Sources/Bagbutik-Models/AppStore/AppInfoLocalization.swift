import Bagbutik_Core
import Foundation

public struct AppInfoLocalization: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appInfoLocalizations" }
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
        public var locale: String?
        public var name: String?
        public var privacyChoicesUrl: String?
        public var privacyPolicyText: String?
        public var privacyPolicyUrl: String?
        public var subtitle: String?

        public init(locale: String? = nil,
                    name: String? = nil,
                    privacyChoicesUrl: String? = nil,
                    privacyPolicyText: String? = nil,
                    privacyPolicyUrl: String? = nil,
                    subtitle: String? = nil)
        {
            self.locale = locale
            self.name = name
            self.privacyChoicesUrl = privacyChoicesUrl
            self.privacyPolicyText = privacyPolicyText
            self.privacyPolicyUrl = privacyPolicyUrl
            self.subtitle = subtitle
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            privacyChoicesUrl = try container.decodeIfPresent(String.self, forKey: "privacyChoicesUrl")
            privacyPolicyText = try container.decodeIfPresent(String.self, forKey: "privacyPolicyText")
            privacyPolicyUrl = try container.decodeIfPresent(String.self, forKey: "privacyPolicyUrl")
            subtitle = try container.decodeIfPresent(String.self, forKey: "subtitle")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(privacyChoicesUrl, forKey: "privacyChoicesUrl")
            try container.encodeIfPresent(privacyPolicyText, forKey: "privacyPolicyText")
            try container.encodeIfPresent(privacyPolicyUrl, forKey: "privacyPolicyUrl")
            try container.encodeIfPresent(subtitle, forKey: "subtitle")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var appInfo: AppInfo?

        public init(appInfo: AppInfo? = nil) {
            self.appInfo = appInfo
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appInfo = try container.decodeIfPresent(AppInfo.self, forKey: "appInfo")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appInfo, forKey: "appInfo")
        }

        public struct AppInfo: Codable, Sendable {
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
                public var type: String { "appInfos" }

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
