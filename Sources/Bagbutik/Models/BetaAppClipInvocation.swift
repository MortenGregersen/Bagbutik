import Foundation

/**
 The data structure that represents a Beta App Clip Invocations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation>
 */
public struct BetaAppClipInvocation: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "betaAppClipInvocations" }
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
     The attributes that describe a Beta App Clip Invocations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/attributes>
     */
    public struct Attributes: Codable {
        /// The invocation URL you configure for testers who use the TestFlight to launch your App Clip.
        public let url: String?

        public init(url: String? = nil) {
            self.url = url
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/relationships>
     */
    public struct Relationships: Codable {
        public let betaAppClipInvocationLocalizations: BetaAppClipInvocationLocalizations?

        public init(betaAppClipInvocationLocalizations: BetaAppClipInvocationLocalizations? = nil) {
            self.betaAppClipInvocationLocalizations = betaAppClipInvocationLocalizations
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/relationships/betaappclipinvocationlocalizations>
         */
        public struct BetaAppClipInvocationLocalizations: Codable {
            /// The type and ID of a related resource.
            public let data: [Data]?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?
            /// Paging information for data responses.
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/relationships/betaappclipinvocationlocalizations/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "betaAppClipInvocationLocalizations" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocation/relationships/betaappclipinvocationlocalizations/links>
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
