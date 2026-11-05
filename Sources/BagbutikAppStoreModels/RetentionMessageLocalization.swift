import BagbutikCore
import Foundation

/**
 # RetentionMessageLocalization

 The header and body text of a retention message version for a single locale.

 ```
 object RetentionMessageLocalization
 ```

 ## Topics

 ### Objects

 [`object RetentionMessageLocalization.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/RetentionMessageLocalization/Attributes-data.dictionary)

 Attributes that describe a retention message localization resource.

 [`object RetentionMessageLocalization.Relationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/RetentionMessageLocalization/Relationships-data.dictionary)

 The relationships you include in the request and those on which you can operate.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/retentionmessagelocalization>
 */
public struct RetentionMessageLocalization: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "retentionMessageLocalizations" }
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
        public var body: String?
        public var header: String?
        public var locale: String?

        public init(body: String? = nil,
                    header: String? = nil,
                    locale: String? = nil)
        {
            self.body = body
            self.header = header
            self.locale = locale
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            body = try container.decodeIfPresent(String.self, forKey: "body")
            header = try container.decodeIfPresent(String.self, forKey: "header")
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(body, forKey: "body")
            try container.encodeIfPresent(header, forKey: "header")
            try container.encodeIfPresent(locale, forKey: "locale")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var retentionMessageVersion: RetentionMessageVersion?

        public init(retentionMessageVersion: RetentionMessageVersion? = nil) {
            self.retentionMessageVersion = retentionMessageVersion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            retentionMessageVersion = try container.decodeIfPresent(RetentionMessageVersion.self, forKey: "retentionMessageVersion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(retentionMessageVersion, forKey: "retentionMessageVersion")
        }

        public struct RetentionMessageVersion: Codable, Sendable {
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
                public var type: String { "retentionMessageVersions" }

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
