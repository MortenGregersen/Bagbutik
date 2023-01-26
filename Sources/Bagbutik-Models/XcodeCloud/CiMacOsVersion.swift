import Bagbutik_Core
import Foundation

/**
 # CiMacOsVersion
 The data structure that represents a macOS Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion>
 */
public struct CiMacOsVersion: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies a macOS Versions resource.
    public let id: String
    /// The navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "ciMacOsVersions" }
    /// The attributes that describe the macOS Versions resource.
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
     # CiMacOsVersion.Attributes
     The attributes that describe a macOS Versions resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/attributes>
     */
    public struct Attributes: Codable {
        /// The name of the macOS version.
        public var name: String?
        /// The macOS version of the simulated environment.
        public var version: String?

        public init(name: String? = nil,
                    version: String? = nil)
        {
            self.name = name
            self.version = version
        }
    }

    /**
     # CiMacOsVersion.Relationships
     The relationships of the macOS Versions resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/relationships>
     */
    public struct Relationships: Codable {
        /// The macOS version’s related Xcode version.
        public var xcodeVersions: XcodeVersions?

        public init(xcodeVersions: XcodeVersions? = nil) {
            self.xcodeVersions = xcodeVersions
        }

        /**
         # CiMacOsVersion.Relationships.XcodeVersions
         The data, links, and paging information that describe the relationship between the macOS Versions and Xcode Versions resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/relationships/xcodeversions>
         */
        public struct XcodeVersions: Codable {
            /// The ID and type of the related Xcode Versions resource.
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                _data = try container.decode(NullCodable<[Data]>.self, forKey: .data)
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
             # CiMacOsVersion.Relationships.XcodeVersions.Data
             The type and ID of a related Xcode Versions resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/relationships/xcodeversions/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Xcode Versions resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciXcodeVersions" }

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
             # CiMacOsVersion.Relationships.XcodeVersions.Links
             The links to the related Xcode Versions resources and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversion/relationships/xcodeversions/links>
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
