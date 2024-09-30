import Bagbutik_Core
import Foundation

/**
 # GameCenterEnabledVersion
 The data structure that represents the Game Center Enabled Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversion>
 */
public struct GameCenterEnabledVersion: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterEnabledVersions" }
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

    /**
     # GameCenterEnabledVersion.Attributes
     Attributes that describe a Game Center Enabled Versions resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversion/attributes>
     */
    public struct Attributes: Codable, Sendable {
        public var iconAsset: ImageAsset?
        public var platform: Platform?
        public var versionString: String?

        public init(iconAsset: ImageAsset? = nil,
                    platform: Platform? = nil,
                    versionString: String? = nil)
        {
            self.iconAsset = iconAsset
            self.platform = platform
            self.versionString = versionString
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            iconAsset = try container.decodeIfPresent(ImageAsset.self, forKey: "iconAsset")
            platform = try container.decodeIfPresent(Platform.self, forKey: "platform")
            versionString = try container.decodeIfPresent(String.self, forKey: "versionString")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(iconAsset, forKey: "iconAsset")
            try container.encodeIfPresent(platform, forKey: "platform")
            try container.encodeIfPresent(versionString, forKey: "versionString")
        }
    }

    /**
     # GameCenterEnabledVersion.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversion/relationships>
     */
    public struct Relationships: Codable, Sendable {
        public var app: App?
        public var compatibleVersions: CompatibleVersions?

        public init(app: App? = nil,
                    compatibleVersions: CompatibleVersions? = nil)
        {
            self.app = app
            self.compatibleVersions = compatibleVersions
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            app = try container.decodeIfPresent(App.self, forKey: "app")
            compatibleVersions = try container.decodeIfPresent(CompatibleVersions.self, forKey: "compatibleVersions")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(app, forKey: "app")
            try container.encodeIfPresent(compatibleVersions, forKey: "compatibleVersions")
        }

        /**
         # GameCenterEnabledVersion.Relationships.App
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversion/relationships/app>
         */
        public struct App: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # GameCenterEnabledVersion.Relationships.App.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversion/relationships/app/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "apps" }

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

            /**
             # GameCenterEnabledVersion.Relationships.App.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversion/relationships/app/links>
             */
            public struct Links: Codable, Sendable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # GameCenterEnabledVersion.Relationships.CompatibleVersions
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversion/relationships/compatibleversions>
         */
        public struct CompatibleVersions: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # GameCenterEnabledVersion.Relationships.CompatibleVersions.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversion/relationships/compatibleversions/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterEnabledVersions" }

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

            /**
             # GameCenterEnabledVersion.Relationships.CompatibleVersions.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversion/relationships/compatibleversions/links>
             */
            public struct Links: Codable, Sendable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
