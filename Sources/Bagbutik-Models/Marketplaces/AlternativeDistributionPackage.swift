import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackage
 The data structure that represents an alternative distribution package resource.

 To learn more about the response that includes this alternative distribution package object, see ``AlternativeDistributionPackageResponse``.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackage>
 */
public struct AlternativeDistributionPackage: Codable, Sendable, Identifiable {
    /// An opaque resource ID that uniquely identifies the alternative distribution package.
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "alternativeDistributionPackages" }
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
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
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    /**
     # AlternativeDistributionPackage.Relationships
     The data structure that represents the relationships of an alternative distribution package resource.

     For more information on the object that owns these relationships, see ``AlternativeDistributionPackage``.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackage/relationships>
     */
    public struct Relationships: Codable, Sendable {
        public var versions: Versions?

        public init(versions: Versions? = nil) {
            self.versions = versions
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            versions = try container.decodeIfPresent(Versions.self, forKey: "versions")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(versions, forKey: "versions")
        }

        /**
         # AlternativeDistributionPackage.Relationships.Versions
         The data structure that represents the versions for the relationships of an alternative distribution package resource.

         For more information on the object that owns these versions, see ``AlternativeDistributionPackage/Relationships``.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackage/relationships/versions>
         */
        public struct Versions: Codable, Sendable {
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
             # AlternativeDistributionPackage.Relationships.Versions.Data
             The data structure that represents a version for the relationships of an alternative distribution package resource.

             For more information on the object that owns this version data, see ``AlternativeDistributionPackage/Relationships/Versions``.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackage/relationships/versions/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// An opaque resource ID that uniquely identifies the alternative distribution package version.
                public let id: String
                public var type: String { "alternativeDistributionPackageVersions" }

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
             # AlternativeDistributionPackage.Relationships.Versions.Links
             The data structure that represents links to a version for the relationships of an alternative distribution package resource.

             For more information on the object that owns this version data, see ``AlternativeDistributionPackage/Relationships/Versions``.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackage/relationships/versions/links>
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
