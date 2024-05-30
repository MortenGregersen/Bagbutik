import Bagbutik_Core
import Foundation

/**
 # CiXcodeVersion
 The data structure that represents an Xcode Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion>
 */
public struct CiXcodeVersion: Codable, Identifiable {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
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
     # CiXcodeVersion.Attributes
     The attributes that describe an Xcode Versions resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/attributes>
     */
    public struct Attributes: Codable {
        /// The name of the Xcode version.
        public var name: String?
        /// A list of the Xcode version’s available test destinations.
        public var testDestinations: [TestDestinations]?
        /// The Xcode version.
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
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decodeIfPresent(String.self, forKey: .name)
            testDestinations = try container.decodeIfPresent([TestDestinations].self, forKey: .testDestinations)
            version = try container.decodeIfPresent(String.self, forKey: .version)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(name, forKey: .name)
            try container.encodeIfPresent(testDestinations, forKey: .testDestinations)
            try container.encodeIfPresent(version, forKey: .version)
        }

        private enum CodingKeys: String, CodingKey {
            case name
            case testDestinations
            case version
        }

        /**
         # CiXcodeVersion.Attributes.TestDestinations
         The test destinations available for an Xcode version.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/attributes/testdestinations>
         */
        public struct TestDestinations: Codable {
            /// A list of runtimes available for the Xcode version.
            public var availableRuntimes: [AvailableRuntimes]?
            /// A string that uniquely identifies the simulated device Xcode Cloud uses for a test action; for example, `com.apple.CoreSimulator.SimDeviceType.iPhone-12`.
            public var deviceTypeIdentifier: String?
            /// The display name of the simulated device Xcode Cloud uses for a test action; for example, `iPhone 12`.
            public var deviceTypeName: String?
            /// A string that indicates whether a test destination is a simulated device or a Mac.
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                availableRuntimes = try container.decodeIfPresent([AvailableRuntimes].self, forKey: .availableRuntimes)
                deviceTypeIdentifier = try container.decodeIfPresent(String.self, forKey: .deviceTypeIdentifier)
                deviceTypeName = try container.decodeIfPresent(String.self, forKey: .deviceTypeName)
                kind = try container.decodeIfPresent(CiTestDestinationKind.self, forKey: .kind)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(availableRuntimes, forKey: .availableRuntimes)
                try container.encodeIfPresent(deviceTypeIdentifier, forKey: .deviceTypeIdentifier)
                try container.encodeIfPresent(deviceTypeName, forKey: .deviceTypeName)
                try container.encodeIfPresent(kind, forKey: .kind)
            }

            private enum CodingKeys: String, CodingKey {
                case availableRuntimes
                case deviceTypeIdentifier
                case deviceTypeName
                case kind
            }

            /**
             # CiXcodeVersion.Attributes.TestDestinations.AvailableRuntimes
             The data structure that represents the available runtimes for test destinations of an Xcode Versions resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/attributes/testdestinations/availableruntimes>
             */
            public struct AvailableRuntimes: Codable {
                /// A string that identifies the simulated environment Xcode Cloud uses for a test action.
                public var runtimeIdentifier: String?
                /// The name of the operating system of the simulated environment Xcode Cloud uses.
                public var runtimeName: String?

                public init(runtimeIdentifier: String? = nil,
                            runtimeName: String? = nil)
                {
                    self.runtimeIdentifier = runtimeIdentifier
                    self.runtimeName = runtimeName
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    runtimeIdentifier = try container.decodeIfPresent(String.self, forKey: .runtimeIdentifier)
                    runtimeName = try container.decodeIfPresent(String.self, forKey: .runtimeName)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(runtimeIdentifier, forKey: .runtimeIdentifier)
                    try container.encodeIfPresent(runtimeName, forKey: .runtimeName)
                }

                private enum CodingKeys: String, CodingKey {
                    case runtimeIdentifier
                    case runtimeName
                }
            }
        }
    }

    /**
     # CiXcodeVersion.Relationships
     The relationships of the Xcode Versions resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/relationships>
     */
    public struct Relationships: Codable {
        /// The related macOS Versions resource.
        public var macOsVersions: MacOsVersions?

        public init(macOsVersions: MacOsVersions? = nil) {
            self.macOsVersions = macOsVersions
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            macOsVersions = try container.decodeIfPresent(MacOsVersions.self, forKey: .macOsVersions)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(macOsVersions, forKey: .macOsVersions)
        }

        private enum CodingKeys: String, CodingKey {
            case macOsVersions
        }

        /**
         # CiXcodeVersion.Relationships.MacOsVersions
         The data, links, and paging information that describe the relationship between the Xcode Versions and the macOS Versions resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/relationships/macosversions>
         */
        public struct MacOsVersions: Codable {
            /// The ID and type of the related macOS Versions resource.
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
                data = try container.decodeIfPresent([Data].self, forKey: .data)
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
             # CiXcodeVersion.Relationships.MacOsVersions.Data
             The type and ID of a related macOS Versions resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/relationships/macosversions/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related macOS Versions resource.
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
             # CiXcodeVersion.Relationships.MacOsVersions.Links
             The links to the related macOS Versions resources and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/relationships/macosversions/links>
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
