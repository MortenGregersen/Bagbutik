import Foundation

/**
 The data structure that represents a Build Beta Details resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetail>
 */
public struct BuildBetaDetail: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "buildBetaDetails" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
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
        case id
        case links
        case type
        case attributes
        case relationships
    }

    /**
     Attributes that describe a Build Beta Details resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetail/attributes>
     */
    public struct Attributes: Codable {
        /// A Boolean value that enables you to send test invitations to users automatically when the build is available to external groups.
        public let autoNotifyEnabled: Bool?
        /// A state that indicates if the build is available for external testing.
        public let externalBuildState: ExternalBetaState?
        /// A state that indicates if the build is available for internal testing.
        public let internalBuildState: InternalBetaState?

        public init(autoNotifyEnabled: Bool? = nil, externalBuildState: ExternalBetaState? = nil, internalBuildState: InternalBetaState? = nil) {
            self.autoNotifyEnabled = autoNotifyEnabled
            self.externalBuildState = externalBuildState
            self.internalBuildState = internalBuildState
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetail/relationships>
     */
    public struct Relationships: Codable {
        public let build: Build?

        public init(build: Build? = nil) {
            self.build = build
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetail/relationships/build>
         */
        public struct Build: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetail/relationships/build/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "builds" }

                public init(id: String) {
                    self.id = id
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
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetail/relationships/build/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
