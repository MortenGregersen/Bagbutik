import Foundation

/**
 The data structure that represents a Products resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct>
 */
public struct CiProduct: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "ciProducts" }
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
     The attributes that describe a Products resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/attributes>
     */
    public struct Attributes: Codable {
        /// The date when you created the Xcode Cloud product.
        public let createdDate: Date?
        /// The name of the Xcode Cloud product.
        public let name: String?
        /// A string that indicates whether the Xcode Cloud product is a framework or an app.
        public let productType: ProductType?

        public init(createdDate: Date? = nil, name: String? = nil, productType: ProductType? = nil) {
            self.createdDate = createdDate
            self.name = name
            self.productType = productType
        }

        public enum ProductType: String, Codable, CaseIterable {
            case app = "APP"
            case framework = "FRAMEWORK"
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships>
     */
    public struct Relationships: Codable {
        public let app: App?
        public let bundleId: BundleId?
        public let primaryRepositories: PrimaryRepositories?

        public init(app: App? = nil, bundleId: BundleId? = nil, primaryRepositories: PrimaryRepositories? = nil) {
            self.app = app
            self.bundleId = bundleId
            self.primaryRepositories = primaryRepositories
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/app>
         */
        public struct App: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/app/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "apps" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/app/links>
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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/bundleid>
         */
        public struct BundleId: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/bundleid/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "bundleIds" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/bundleid/links>
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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/primaryrepositories>
         */
        public struct PrimaryRepositories: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/primaryrepositories/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "scmRepositories" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/primaryrepositories/links>
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
