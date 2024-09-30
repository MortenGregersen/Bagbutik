import Bagbutik_Core
import Foundation

/**
 # AppClipDefaultExperienceLocalization
 The data structure that represents a Default App Clip Experience Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization>
 */
public struct AppClipDefaultExperienceLocalization: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Default App Clip Experience Localizations resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "appClipDefaultExperienceLocalizations" }
    /// The attributes that describe the Default App Clip Experience Localizations resource.
    public var attributes: Attributes?
    /// The navigational links to related data and included resource types and IDs.
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
     # AppClipDefaultExperienceLocalization.Attributes
     The attributes that describe a Default App Clip Experience Localizations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// The specified locale.
        public var locale: String?
        /// The subtitle that appears on the App Clip card for the default App Clip experience.
        public var subtitle: String?

        public init(locale: String? = nil,
                    subtitle: String? = nil)
        {
            self.locale = locale
            self.subtitle = subtitle
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            subtitle = try container.decodeIfPresent(String.self, forKey: "subtitle")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(subtitle, forKey: "subtitle")
        }
    }

    /**
     # AppClipDefaultExperienceLocalization.Relationships
     The relationships of the Default App Clip Experience Localizations resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships>
     */
    public struct Relationships: Codable, Sendable {
        /// The related Default App Clip Experiences resource.
        public var appClipDefaultExperience: AppClipDefaultExperience?
        /// The related App Clip Header Images resource.
        public var appClipHeaderImage: AppClipHeaderImage?

        public init(appClipDefaultExperience: AppClipDefaultExperience? = nil,
                    appClipHeaderImage: AppClipHeaderImage? = nil)
        {
            self.appClipDefaultExperience = appClipDefaultExperience
            self.appClipHeaderImage = appClipHeaderImage
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appClipDefaultExperience = try container.decodeIfPresent(AppClipDefaultExperience.self, forKey: "appClipDefaultExperience")
            appClipHeaderImage = try container.decodeIfPresent(AppClipHeaderImage.self, forKey: "appClipHeaderImage")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appClipDefaultExperience, forKey: "appClipDefaultExperience")
            try container.encodeIfPresent(appClipHeaderImage, forKey: "appClipHeaderImage")
        }

        /**
         # AppClipDefaultExperienceLocalization.Relationships.AppClipDefaultExperience
         The data and links that describe the relationship between the Default App Clip Experience Localizations and the Default App Clip Experiences resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipdefaultexperience>
         */
        public struct AppClipDefaultExperience: Codable, Sendable {
            /// The ID and type of the related Default App Clip Experiences resource.
            @NullCodable public var data: Data?
            /// Navigational links that include the self-link.
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
             # AppClipDefaultExperienceLocalization.Relationships.AppClipDefaultExperience.Data
             The type and ID of a related Default App Clip Experience Localizations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipdefaultexperience/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Default App Clip Experiences resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipDefaultExperiences" }

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
             # AppClipDefaultExperienceLocalization.Relationships.AppClipDefaultExperience.Links
             The links to the related Default App Clip Experiences resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipdefaultexperience/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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
         # AppClipDefaultExperienceLocalization.Relationships.AppClipHeaderImage
         The data and links that describe the relationship between the Default App Clip Experience Localizations and the App Clip Header Images resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipheaderimage>
         */
        public struct AppClipHeaderImage: Codable, Sendable {
            /// The ID and type of the related App Clip Header Images resource.
            @NullCodable public var data: Data?
            /// Navigational links that include the self-link.
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
             # AppClipDefaultExperienceLocalization.Relationships.AppClipHeaderImage.Data
             The type and ID of a related App Clip Header Images resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipheaderimage/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related App Clip Header Images resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipHeaderImages" }

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
             # AppClipDefaultExperienceLocalization.Relationships.AppClipHeaderImage.Links
             The links to the related App Clip Header Images resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipheaderimage/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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
