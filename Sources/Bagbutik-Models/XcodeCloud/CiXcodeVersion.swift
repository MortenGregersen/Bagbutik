import Bagbutik_Core
import Foundation

/**
 # CiXcodeVersion
 The data structure that represents an Xcode Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion>
 */
public struct CiXcodeVersion: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies an Xcode Versions resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "ciXcodeVersions" }
    /// The attributes that describe the Xcode Versions resource.
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

    public struct Attributes: Codable, Sendable {
        public var name: String?
        public var testDestinations: [TestDestinations]?
        public var version: String?

        public init(name: String? = nil,
                    testDestinations: [TestDestinations]? = nil,
                    version: String? = nil)
        {
            self.name = name
            self.testDestinations = testDestinations
            self.version = version
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            name = try container.decodeIfPresent(String.self, forKey: "name")
            testDestinations = try container.decodeIfPresent([TestDestinations].self, forKey: "testDestinations")
            version = try container.decodeIfPresent(String.self, forKey: "version")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(testDestinations, forKey: "testDestinations")
            try container.encodeIfPresent(version, forKey: "version")
        }

        public struct TestDestinations: Codable, Sendable {
            public var availableRuntimes: [AvailableRuntimes]?
            public var deviceTypeIdentifier: String?
            public var deviceTypeName: String?
            public var kind: CiTestDestinationKind?

            public init(availableRuntimes: [AvailableRuntimes]? = nil,
                        deviceTypeIdentifier: String? = nil,
                        deviceTypeName: String? = nil,
                        kind: CiTestDestinationKind? = nil)
            {
                self.availableRuntimes = availableRuntimes
                self.deviceTypeIdentifier = deviceTypeIdentifier
                self.deviceTypeName = deviceTypeName
                self.kind = kind
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                availableRuntimes = try container.decodeIfPresent([AvailableRuntimes].self, forKey: "availableRuntimes")
                deviceTypeIdentifier = try container.decodeIfPresent(String.self, forKey: "deviceTypeIdentifier")
                deviceTypeName = try container.decodeIfPresent(String.self, forKey: "deviceTypeName")
                kind = try container.decodeIfPresent(CiTestDestinationKind.self, forKey: "kind")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(availableRuntimes, forKey: "availableRuntimes")
                try container.encodeIfPresent(deviceTypeIdentifier, forKey: "deviceTypeIdentifier")
                try container.encodeIfPresent(deviceTypeName, forKey: "deviceTypeName")
                try container.encodeIfPresent(kind, forKey: "kind")
            }

            public struct AvailableRuntimes: Codable, Sendable {
                public var runtimeIdentifier: String?
                public var runtimeName: String?

                public init(runtimeIdentifier: String? = nil,
                            runtimeName: String? = nil)
                {
                    self.runtimeIdentifier = runtimeIdentifier
                    self.runtimeName = runtimeName
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    runtimeIdentifier = try container.decodeIfPresent(String.self, forKey: "runtimeIdentifier")
                    runtimeName = try container.decodeIfPresent(String.self, forKey: "runtimeName")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(runtimeIdentifier, forKey: "runtimeIdentifier")
                    try container.encodeIfPresent(runtimeName, forKey: "runtimeName")
                }
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var macOsVersions: MacOsVersions?

        public init(macOsVersions: MacOsVersions? = nil) {
            self.macOsVersions = macOsVersions
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            macOsVersions = try container.decodeIfPresent(MacOsVersions.self, forKey: "macOsVersions")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(macOsVersions, forKey: "macOsVersions")
        }

        public struct MacOsVersions: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "ciMacOsVersions" }

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
        }
    }
}
