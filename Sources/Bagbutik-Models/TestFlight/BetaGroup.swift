import Bagbutik_Core
import Foundation

/**
 # BetaGroup
 The data structure that represents a Beta Groups resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroup>
 */
public struct BetaGroup: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "betaGroups" }
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
     # BetaGroup.Attributes
     Attributes that describe a Beta Groups resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// The creation date of the beta group.
        public var createdDate: Date?
        public var feedbackEnabled: Bool?
        public var hasAccessToAllBuilds: Bool?
        public var iosBuildsAvailableForAppleSiliconMac: Bool?
        /// A Boolean value that indicates whether the group is internal. Only existing users of App Store Connect may be added for internal beta testing.
        public var isInternalGroup: Bool?
        /// The name for the beta group.
        public var name: String?
        /// The URL of the public link provided to your app's beta testers.
        public var publicLink: String?
        /// A Boolean value that indicates whether a public link is enabled. Enabling a link allows you to invite anyone outside of your team to beta test your app. When you share this link, testers will be able to install the beta version of your app on their devices in TestFlight and share the link with others.
        public var publicLinkEnabled: Bool?
        /// The ID as part of the URL of the public link.
        public var publicLinkId: String?
        /// The maximum number of testers that can join this beta group using the public link. Values must be between 1 and 10,000.
        public var publicLinkLimit: Int?
        /// A Boolean value that limits the number of testers who can join the beta group using the public link.
        public var publicLinkLimitEnabled: Bool?

        public init(createdDate: Date? = nil,
                    feedbackEnabled: Bool? = nil,
                    hasAccessToAllBuilds: Bool? = nil,
                    iosBuildsAvailableForAppleSiliconMac: Bool? = nil,
                    isInternalGroup: Bool? = nil,
                    name: String? = nil,
                    publicLink: String? = nil,
                    publicLinkEnabled: Bool? = nil,
                    publicLinkId: String? = nil,
                    publicLinkLimit: Int? = nil,
                    publicLinkLimitEnabled: Bool? = nil)
        {
            self.createdDate = createdDate
            self.feedbackEnabled = feedbackEnabled
            self.hasAccessToAllBuilds = hasAccessToAllBuilds
            self.iosBuildsAvailableForAppleSiliconMac = iosBuildsAvailableForAppleSiliconMac
            self.isInternalGroup = isInternalGroup
            self.name = name
            self.publicLink = publicLink
            self.publicLinkEnabled = publicLinkEnabled
            self.publicLinkId = publicLinkId
            self.publicLinkLimit = publicLinkLimit
            self.publicLinkLimitEnabled = publicLinkLimitEnabled
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            feedbackEnabled = try container.decodeIfPresent(Bool.self, forKey: "feedbackEnabled")
            hasAccessToAllBuilds = try container.decodeIfPresent(Bool.self, forKey: "hasAccessToAllBuilds")
            iosBuildsAvailableForAppleSiliconMac = try container.decodeIfPresent(Bool.self, forKey: "iosBuildsAvailableForAppleSiliconMac")
            isInternalGroup = try container.decodeIfPresent(Bool.self, forKey: "isInternalGroup")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            publicLink = try container.decodeIfPresent(String.self, forKey: "publicLink")
            publicLinkEnabled = try container.decodeIfPresent(Bool.self, forKey: "publicLinkEnabled")
            publicLinkId = try container.decodeIfPresent(String.self, forKey: "publicLinkId")
            publicLinkLimit = try container.decodeIfPresent(Int.self, forKey: "publicLinkLimit")
            publicLinkLimitEnabled = try container.decodeIfPresent(Bool.self, forKey: "publicLinkLimitEnabled")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(feedbackEnabled, forKey: "feedbackEnabled")
            try container.encodeIfPresent(hasAccessToAllBuilds, forKey: "hasAccessToAllBuilds")
            try container.encodeIfPresent(iosBuildsAvailableForAppleSiliconMac, forKey: "iosBuildsAvailableForAppleSiliconMac")
            try container.encodeIfPresent(isInternalGroup, forKey: "isInternalGroup")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(publicLink, forKey: "publicLink")
            try container.encodeIfPresent(publicLinkEnabled, forKey: "publicLinkEnabled")
            try container.encodeIfPresent(publicLinkId, forKey: "publicLinkId")
            try container.encodeIfPresent(publicLinkLimit, forKey: "publicLinkLimit")
            try container.encodeIfPresent(publicLinkLimitEnabled, forKey: "publicLinkLimitEnabled")
        }
    }

    /**
     # BetaGroup.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships>
     */
    public struct Relationships: Codable, Sendable {
        public var app: App?
        public var betaTesters: BetaTesters?
        public var builds: Builds?

        public init(app: App? = nil,
                    betaTesters: BetaTesters? = nil,
                    builds: Builds? = nil)
        {
            self.app = app
            self.betaTesters = betaTesters
            self.builds = builds
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            app = try container.decodeIfPresent(App.self, forKey: "app")
            betaTesters = try container.decodeIfPresent(BetaTesters.self, forKey: "betaTesters")
            builds = try container.decodeIfPresent(Builds.self, forKey: "builds")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(app, forKey: "app")
            try container.encodeIfPresent(betaTesters, forKey: "betaTesters")
            try container.encodeIfPresent(builds, forKey: "builds")
        }

        /**
         # BetaGroup.Relationships.App
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships/app>
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
             # BetaGroup.Relationships.App.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships/app/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
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
             # BetaGroup.Relationships.App.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships/app/links>
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
         # BetaGroup.Relationships.BetaTesters
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships/betatesters>
         */
        public struct BetaTesters: Codable, Sendable {
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
             # BetaGroup.Relationships.BetaTesters.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships/betatesters/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "betaTesters" }

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
             # BetaGroup.Relationships.BetaTesters.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships/betatesters/links>
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
         # BetaGroup.Relationships.Builds
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships/builds>
         */
        public struct Builds: Codable, Sendable {
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
             # BetaGroup.Relationships.Builds.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships/builds/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
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
             # BetaGroup.Relationships.Builds.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betagroup/relationships/builds/links>
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
