import Foundation

/**
 The data structure that represents a macOS Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion>
 */
public struct CiMacOsVersion: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "ciMacOsVersions" }
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
     The attributes that describe a macOS Versions resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/attributes>
     */
    public struct Attributes: Codable {
        /// The name of the macOS version.
        public let name: String?
        /// The macOS version of the simulated environment.
        public let version: String?

        public init(name: String? = nil, version: String? = nil) {
            self.name = name
            self.version = version
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/relationships>
     */
    public struct Relationships: Codable {
        public let xcodeVersions: XcodeVersions?

        public init(xcodeVersions: XcodeVersions? = nil) {
            self.xcodeVersions = xcodeVersions
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/relationships/xcodeversions>
         */
        public struct XcodeVersions: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/relationships/xcodeversions/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciXcodeVersions" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/relationships/xcodeversions/links>
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
