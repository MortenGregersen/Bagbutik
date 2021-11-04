import Foundation

/**
 The data structure that represents a Beta Build Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization>
 */
public struct BetaBuildLocalization: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "betaBuildLocalizations" }
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

    /**
     Attributes that describe a Beta Build Localizations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/attributes>
     */
    public struct Attributes: Codable {
        /// The specified locale. Refer to Table 1 for possible values.
        public let locale: String?
        /// A field that describes changes and additions to a build and indicates features you would like your users to test.
        public let whatsNew: String?

        public init(locale: String? = nil, whatsNew: String? = nil) {
            self.locale = locale
            self.whatsNew = whatsNew
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/relationships>
     */
    public struct Relationships: Codable {
        public let build: Build?

        public init(build: Build? = nil) {
            self.build = build
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/relationships/build>
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
             <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/relationships/build/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "builds" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalization/relationships/build/links>
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
