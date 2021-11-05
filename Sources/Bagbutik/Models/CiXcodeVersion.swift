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

    public struct Attributes: Codable {
        /// The name of the Xcode version.
        public let name: String?
        /// A list of the Xcode version’s available test destinations.
        public let testDestinations: [TestDestinations]?
        /// The Xcode version.
        public let version: String?

        public init(name: String? = nil, testDestinations: [TestDestinations]? = nil, version: String? = nil) {
            self.name = name
            self.testDestinations = testDestinations
            self.version = version
        }

        public struct TestDestinations: Codable {
            public let availableRuntimes: [AvailableRuntimes]?
            public let deviceTypeIdentifier: String?
            public let deviceTypeName: String?
            public let kind: CiTestDestinationKind?

            public init(availableRuntimes: [AvailableRuntimes]? = nil, deviceTypeIdentifier: String? = nil, deviceTypeName: String? = nil, kind: CiTestDestinationKind? = nil) {
                self.availableRuntimes = availableRuntimes
                self.deviceTypeIdentifier = deviceTypeIdentifier
                self.deviceTypeName = deviceTypeName
                self.kind = kind
            }

            public struct AvailableRuntimes: Codable {
                public let runtimeIdentifier: String?
                public let runtimeName: String?

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
        public let macOsVersions: MacOsVersions?

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
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversion/relationships/macosversions/links>
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
