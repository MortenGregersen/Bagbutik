import Foundation

/**
 The data structure that represents an Xcode Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion>
 */
public struct CiXcodeVersion: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "ciXcodeVersions" }
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

    public struct Attributes: Codable {
        /// The name of the Xcode version.
        public var name: String?
        /// A list of the Xcode version’s available test destinations.
        public var testDestinations: [TestDestinations]?
        /// The Xcode version.
        public var version: String?

        public init(name: String? = nil, testDestinations: [TestDestinations]? = nil, version: String? = nil) {
            self.name = name
            self.testDestinations = testDestinations
            self.version = version
        }

        public struct TestDestinations: Codable {
            public var availableRuntimes: [AvailableRuntimes]?
            public var deviceTypeIdentifier: String?
            public var deviceTypeName: String?
            public var kind: CiTestDestinationKind?

            public init(availableRuntimes: [AvailableRuntimes]? = nil, deviceTypeIdentifier: String? = nil, deviceTypeName: String? = nil, kind: CiTestDestinationKind? = nil) {
                self.availableRuntimes = availableRuntimes
                self.deviceTypeIdentifier = deviceTypeIdentifier
                self.deviceTypeName = deviceTypeName
                self.kind = kind
            }

            public struct AvailableRuntimes: Codable {
                public var runtimeIdentifier: String?
                public var runtimeName: String?

                public init(runtimeIdentifier: String? = nil, runtimeName: String? = nil) {
                    self.runtimeIdentifier = runtimeIdentifier
                    self.runtimeName = runtimeName
                }
            }
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/relationships>
     */
    public struct Relationships: Codable {
        public var macOsVersions: MacOsVersions?

        public init(macOsVersions: MacOsVersions? = nil) {
            self.macOsVersions = macOsVersions
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/relationships/macosversions>
         */
        public struct MacOsVersions: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: [Data]?
            /// The links to the related data and the relationship's self-link.
            public var links: Links?
            /// Paging information for data responses.
            public var meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/relationships/macosversions/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciMacOsVersions" }

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
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/relationships/macosversions/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public var related: String?
                /// The relationship's self-link
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
