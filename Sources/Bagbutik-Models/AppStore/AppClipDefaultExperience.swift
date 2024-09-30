import Bagbutik_Core
import Foundation

/**
 # AppClipDefaultExperience
 The data structure that represents a Default App Clip Experiences resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience>
 */
public struct AppClipDefaultExperience: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Default App Clip Experiences resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "appClipDefaultExperiences" }
    /// The attributes that describe the Default App Clip Experiences resource.
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
     # AppClipDefaultExperience.Attributes
     The attributes that describe a Default App Clip Experiences resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// The call-to-action verb that appears on the App Clip card.
        public var action: AppClipAction?

        public init(action: AppClipAction? = nil) {
            self.action = action
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            action = try container.decodeIfPresent(AppClipAction.self, forKey: "action")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(action, forKey: "action")
        }
    }

    /**
     # AppClipDefaultExperience.Relationships
     The relationships of the Default App Clip Experiences resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships>
     */
    public struct Relationships: Codable, Sendable {
        /// The related App Clips resource.
        public var appClip: AppClip?
        /// The related App Clip App Store Review Details resource.
        public var appClipAppStoreReviewDetail: AppClipAppStoreReviewDetail?
        /// The related Default App Clip Experience Localizations resource.
        public var appClipDefaultExperienceLocalizations: AppClipDefaultExperienceLocalizations?
        /// The related App Store Versions resource.
        public var releaseWithAppStoreVersion: ReleaseWithAppStoreVersion?

        public init(appClip: AppClip? = nil,
                    appClipAppStoreReviewDetail: AppClipAppStoreReviewDetail? = nil,
                    appClipDefaultExperienceLocalizations: AppClipDefaultExperienceLocalizations? = nil,
                    releaseWithAppStoreVersion: ReleaseWithAppStoreVersion? = nil)
        {
            self.appClip = appClip
            self.appClipAppStoreReviewDetail = appClipAppStoreReviewDetail
            self.appClipDefaultExperienceLocalizations = appClipDefaultExperienceLocalizations
            self.releaseWithAppStoreVersion = releaseWithAppStoreVersion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appClip = try container.decodeIfPresent(AppClip.self, forKey: "appClip")
            appClipAppStoreReviewDetail = try container.decodeIfPresent(AppClipAppStoreReviewDetail.self, forKey: "appClipAppStoreReviewDetail")
            appClipDefaultExperienceLocalizations = try container.decodeIfPresent(AppClipDefaultExperienceLocalizations.self, forKey: "appClipDefaultExperienceLocalizations")
            releaseWithAppStoreVersion = try container.decodeIfPresent(ReleaseWithAppStoreVersion.self, forKey: "releaseWithAppStoreVersion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appClip, forKey: "appClip")
            try container.encodeIfPresent(appClipAppStoreReviewDetail, forKey: "appClipAppStoreReviewDetail")
            try container.encodeIfPresent(appClipDefaultExperienceLocalizations, forKey: "appClipDefaultExperienceLocalizations")
            try container.encodeIfPresent(releaseWithAppStoreVersion, forKey: "releaseWithAppStoreVersion")
        }

        /**
         # AppClipDefaultExperience.Relationships.AppClip
         The data and links that describe the relationship between the Default App Clip Experiences and the App Clips resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/appclip>
         */
        public struct AppClip: Codable, Sendable {
            /// The ID and type of the related App Clips resource.
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
             # AppClipDefaultExperience.Relationships.AppClip.Data
             The type and ID of a related App Clips resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/appclip/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies an App Clips resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClips" }

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
             # AppClipDefaultExperience.Relationships.AppClip.Links
             The links to the related App Clips resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/appclip/links>
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
         # AppClipDefaultExperience.Relationships.AppClipAppStoreReviewDetail
         The data and links that describe the relationship between the Default App Clip Experiences and the App Clip App Store Review Details resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/appclipappstorereviewdetail>
         */
        public struct AppClipAppStoreReviewDetail: Codable, Sendable {
            /// The ID and type of the related App Clip App Store Review Details resource.
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
             # AppClipDefaultExperience.Relationships.AppClipAppStoreReviewDetail.Data
             The type and ID of a related App Clip App Store Details resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/appclipappstorereviewdetail/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related App Clip App Store Review Details resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipAppStoreReviewDetails" }

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
             # AppClipDefaultExperience.Relationships.AppClipAppStoreReviewDetail.Links
             The links to the related App Clip App Store Review Details resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/appclipappstorereviewdetail/links>
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
         # AppClipDefaultExperience.Relationships.AppClipDefaultExperienceLocalizations
         The data, links, and paging information that describe the relationship between the Default App Clip Experiences and the Default App Clip Experience Localizations resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/appclipdefaultexperiencelocalizations>
         */
        public struct AppClipDefaultExperienceLocalizations: Codable, Sendable {
            /// The ID and type of the related Default App Clip Experience Localizations resource.
            @NullCodable public var data: [Data]?
            /// Navigational links that include the self-link.
            public var links: Links?
            /// The paging information.
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
             # AppClipDefaultExperience.Relationships.AppClipDefaultExperienceLocalizations.Data
             The type and ID of a related Default App Clip Experience Localizations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/appclipdefaultexperiencelocalizations/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies a Default App Clip Experience Localizations resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipDefaultExperienceLocalizations" }

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
             # AppClipDefaultExperience.Relationships.AppClipDefaultExperienceLocalizations.Links
             The links to the related Default App Clip Experience Localizations resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/appclipdefaultexperiencelocalizations/links>
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
         # AppClipDefaultExperience.Relationships.ReleaseWithAppStoreVersion
         The data and links that describe the relationship between the Default App Clip Experiences and the App Store Versions resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/releasewithappstoreversion>
         */
        public struct ReleaseWithAppStoreVersion: Codable, Sendable {
            /// The ID and type of the related App Store Versions resource.
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
             # AppClipDefaultExperience.Relationships.ReleaseWithAppStoreVersion.Data
             The type and ID of a related App Store Versions resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/releasewithappstoreversion/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related App Store Versions resource.
                public let id: String
                /// The resource type.
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

            /**
             # AppClipDefaultExperience.Relationships.ReleaseWithAppStoreVersion.Links
             The links to the related App Store Versions resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperience/relationships/releasewithappstoreversion/links>
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
