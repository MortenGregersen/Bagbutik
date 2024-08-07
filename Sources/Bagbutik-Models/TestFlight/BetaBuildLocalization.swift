import Bagbutik_Core
import Foundation

/**
 # BetaBuildLocalization
 The data structure that represents a Beta Build Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization>
 */
public struct BetaBuildLocalization: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "betaBuildLocalizations" }
    /// The resource's attributes.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
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
     # BetaBuildLocalization.Attributes
     Attributes that describe a Beta Build Localizations resource.

     Table 1 lists allowed locale values.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/attributes>
     */
    public struct Attributes: Codable {
        /// The specified locale. Refer to [Table 1](https://developer.apple.com/documentation/appstoreconnectapi/prerelease_versions_and_beta_testers/beta_build_localizations/betabuildlocalization/attributes#3042206) for possible values.
        public var locale: String?
        /// A field that describes changes and additions to a build and indicates features you would like your users to test.
        public var whatsNew: String?

        public init(locale: String? = nil,
                    whatsNew: String? = nil)
        {
            self.locale = locale
            self.whatsNew = whatsNew
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            whatsNew = try container.decodeIfPresent(String.self, forKey: "whatsNew")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(whatsNew, forKey: "whatsNew")
        }
    }

    /**
     # BetaBuildLocalization.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/relationships>
     */
    public struct Relationships: Codable {
        public var build: Build?

        public init(build: Build? = nil) {
            self.build = build
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            build = try container.decodeIfPresent(Build.self, forKey: "build")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(build, forKey: "build")
        }

        /**
         # BetaBuildLocalization.Relationships.Build
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/relationships/build>
         */
        public struct Build: Codable {
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
             # BetaBuildLocalization.Relationships.Build.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/relationships/build/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "builds" }

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
             # BetaBuildLocalization.Relationships.Build.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/relationships/build/links>
             */
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
