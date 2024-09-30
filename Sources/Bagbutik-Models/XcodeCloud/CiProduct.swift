import Bagbutik_Core
import Foundation

/**
 # CiProduct
 The data structure that represents a Products resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct>
 */
public struct CiProduct: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Products resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "ciProducts" }
    /// The attributes that describe the Products resource.
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
     # CiProduct.Attributes
     The attributes that describe a Products resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// The date when you created the Xcode Cloud product.
        public var createdDate: Date?
        /// The name of the Xcode Cloud product.
        public var name: String?
        /// A string that indicates whether the Xcode Cloud product is a framework or an app.
        public var productType: ProductType?

        public init(createdDate: Date? = nil,
                    name: String? = nil,
                    productType: ProductType? = nil)
        {
            self.createdDate = createdDate
            self.name = name
            self.productType = productType
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            productType = try container.decodeIfPresent(ProductType.self, forKey: "productType")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(productType, forKey: "productType")
        }

        public enum ProductType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app = "APP"
            case framework = "FRAMEWORK"
        }
    }

    /**
     # CiProduct.Relationships
     The relationships of the Products resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships>
     */
    public struct Relationships: Codable, Sendable {
        /// The related Apps resource.
        public var app: App?
        /// The related bundle ID.
        public var bundleId: BundleId?
        /// The related primary repository.
        public var primaryRepositories: PrimaryRepositories?

        public init(app: App? = nil,
                    bundleId: BundleId? = nil,
                    primaryRepositories: PrimaryRepositories? = nil)
        {
            self.app = app
            self.bundleId = bundleId
            self.primaryRepositories = primaryRepositories
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            app = try container.decodeIfPresent(App.self, forKey: "app")
            bundleId = try container.decodeIfPresent(BundleId.self, forKey: "bundleId")
            primaryRepositories = try container.decodeIfPresent(PrimaryRepositories.self, forKey: "primaryRepositories")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(app, forKey: "app")
            try container.encodeIfPresent(bundleId, forKey: "bundleId")
            try container.encodeIfPresent(primaryRepositories, forKey: "primaryRepositories")
        }

        /**
         # CiProduct.Relationships.App
         The data and links that describe the relationship between the Products and Apps resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/app>
         */
        public struct App: Codable, Sendable {
            /// The ID and type of the related Apps resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
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
             # CiProduct.Relationships.App.Data
             The type and ID of a related Apps resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/app/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Apps resource.
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
             # CiProduct.Relationships.App.Links
             The links to the related Apps resource and the relationship self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/app/links>
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
         # CiProduct.Relationships.BundleId
         The data and links that describe the relationship between the Products and the Bundle IDs resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/bundleid>
         */
        public struct BundleId: Codable, Sendable {
            /// The ID and type of the related Bundle IDs resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
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
             # CiProduct.Relationships.BundleId.Data
             The type and ID of a related Bundle IDs resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/bundleid/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Bundle IDs resource.
                public let id: String
                /// The resource type.
                public var type: String { "bundleIds" }

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
             # CiProduct.Relationships.BundleId.Links
             The links to the related Bundle IDs resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/bundleid/links>
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
         # CiProduct.Relationships.PrimaryRepositories
         The data, links, and paging information that describe the relationship between the Products resource and the Repositories resource that represents the primary repository.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/primaryrepositories>
         */
        public struct PrimaryRepositories: Codable, Sendable {
            /// The ID and type of the related Repositories resource that represents the primary repository.
            @NullCodable public var data: [Data]?
            /// The navigational links that include the self-link.
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
             # CiProduct.Relationships.PrimaryRepositories.Data
             The type and ID of a related Repositories resource that represents the product’s primary repositories.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/primaryrepositories/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Repositories resource that represents the primary repository.
                public let id: String
                /// The resource type.
                public var type: String { "scmRepositories" }

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
             # CiProduct.Relationships.PrimaryRepositories.Links
             The links to the related Repositories resources that represents primary repositories and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciproduct/relationships/primaryrepositories/links>
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
