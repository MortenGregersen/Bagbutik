import Foundation

/**
 The data structure that represents a Products resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct>
 */
public struct CiProduct: Codable {
    /// The opaque resource ID that uniquely identifies a Products resource.
    public let id: String
    /// The navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "ciProducts" }
    /// The attributes that describe the Products resource.
    public var attributes: Attributes?
    /// The navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
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
        case id
        case links
        case type
        case attributes
        case relationships
    }

    /**
     The attributes that describe a Products resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/attributes>
     */
    public struct Attributes: Codable {
        /// The date when you created the Xcode Cloud product.
        public var createdDate: Date?
        /// The name of the Xcode Cloud product.
        public var name: String?
        /// A string that indicates whether the Xcode Cloud product is a framework or an app.
        public var productType: ProductType?

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
     The relationships of the Products resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships>
     */
    public struct Relationships: Codable {
        /// The related Apps resource.
        public var app: App?
        /// The related bundle ID.
        public var bundleId: BundleId?
        /// The related primary repository.
        public var primaryRepositories: PrimaryRepositories?

        public init(app: App? = nil, bundleId: BundleId? = nil, primaryRepositories: PrimaryRepositories? = nil) {
            self.app = app
            self.bundleId = bundleId
            self.primaryRepositories = primaryRepositories
        }

        /**
         The data and links that describe the relationship between the Products and Apps resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/app>
         */
        public struct App: Codable {
            /// The ID and type of the related Apps resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related Apps resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/app/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the related Apps resource.
                public let id: String
                /// The resource type.
                public var type: String { "apps" }

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
             The links to the related Apps resource and the relationship self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/app/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil, self itself: String? = nil) {
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
                    case related
                    case itself = "self"
                }
            }
        }

        /**
         The data and links that describe the relationship between the Products and the Bundle IDs resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/bundleid>
         */
        public struct BundleId: Codable {
            /// The ID and type of the related Bundle IDs resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related Bundle IDs resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/bundleid/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the related Bundle IDs resource.
                public let id: String
                /// The resource type.
                public var type: String { "bundleIds" }

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
             The links to the related Bundle IDs resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/bundleid/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil, self itself: String? = nil) {
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
                    case related
                    case itself = "self"
                }
            }
        }

        /**
         The data, links, and paging information that describe the relationship between the Products resource and the Repositories resource that represents the primary repository.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/primaryrepositories>
         */
        public struct PrimaryRepositories: Codable {
            /// The ID and type of the related Repositories resource that represents the primary repository.
            @NullCodable public var data: [Data]?
            /// The navigational links that include the self-link.
            public var links: Links?
            /// The paging information.
            public var meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /**
             The type and ID of a related Repositories resource that represents the product’s primary repositories.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/primaryrepositories/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the related Repositories resource that represents the primary repository.
                public let id: String
                /// The resource type.
                public var type: String { "scmRepositories" }

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
             The links to the related Repositories resources that represents primary repositories and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/primaryrepositories/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil, self itself: String? = nil) {
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
                    case related
                    case itself = "self"
                }
            }
        }
    }
}
