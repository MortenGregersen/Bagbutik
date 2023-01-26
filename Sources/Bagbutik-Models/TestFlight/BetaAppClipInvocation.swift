import Bagbutik_Core
import Foundation

/**
 # BetaAppClipInvocation
 The data structure that represents a Beta App Clip Invocations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation>
 */
public struct BetaAppClipInvocation: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Beta App Clip Invocations resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "betaAppClipInvocations" }
    /// The attributes that describe the Beta App Clip Invocations resource.
    public var attributes: Attributes?
    /// The navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
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
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    /**
     # BetaAppClipInvocation.Attributes
     The attributes that describe a Beta App Clip Invocations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/attributes>
     */
    public struct Attributes: Codable {
        /// The invocation URL you configure for testers who use the TestFlight to launch your App Clip.
        public var url: String?

        public init(url: String? = nil) {
            self.url = url
        }
    }

    /**
     # BetaAppClipInvocation.Relationships
     The relationships of the Beta App Clip Invocations resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/relationships>
     */
    public struct Relationships: Codable {
        /// The related Beta App Clip Invocation Localizations resource.
        public var betaAppClipInvocationLocalizations: BetaAppClipInvocationLocalizations?

        public init(betaAppClipInvocationLocalizations: BetaAppClipInvocationLocalizations? = nil) {
            self.betaAppClipInvocationLocalizations = betaAppClipInvocationLocalizations
        }

        /**
         # BetaAppClipInvocation.Relationships.BetaAppClipInvocationLocalizations
         The data, links, and paging information that describe the relationship between the Beta App Clip Invocations and the Beta App Clip Invocation Localizations resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/relationships/betaappclipinvocationlocalizations>
         */
        public struct BetaAppClipInvocationLocalizations: Codable {
            /// The ID and type of the related Beta App Clip Invocation Localizations resource.
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            /**
             # BetaAppClipInvocation.Relationships.BetaAppClipInvocationLocalizations.Data
             The type and ID of a related Beta App Clip Invocation Localizations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/relationships/betaappclipinvocationlocalizations/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Beta App Clip Invocation Localizations resource.
                public let id: String
                /// The resource type.
                public var type: String { "betaAppClipInvocationLocalizations" }

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
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /**
             # BetaAppClipInvocation.Relationships.BetaAppClipInvocationLocalizations.Links
             The links to the related Beta App Clip Invocation Localizations resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/relationships/betaappclipinvocationlocalizations/links>
             */
            public struct Links: Codable {
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
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
