import Foundation

/**
 The request body you use to update an App Store Version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest>
 */
public struct AppStoreVersionUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appStoreVersions" }
        /// The resource's attributes.
        public let attributes: Attributes?
        /// The types and IDs of the related data to update.
        public let relationships: Relationships?

        public init(id: String, attributes: Attributes? = nil, relationships: Relationships? = nil) {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
            case relationships
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let copyright: String?
            public let downloadable: Bool?
            public let earliestReleaseDate: Date?
            public let releaseType: AppStoreVersion.Attributes.ReleaseType?
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var usesIdfa: Bool? = nil
            public let versionString: String?

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(copyright: String? = nil, downloadable: Bool? = nil, earliestReleaseDate: Date? = nil, releaseType: AppStoreVersion.Attributes.ReleaseType? = nil, usesIdfa: Bool? = nil, versionString: String? = nil) {
                self.copyright = copyright
                self.downloadable = downloadable
                self.earliestReleaseDate = earliestReleaseDate
                self.releaseType = releaseType
                self.usesIdfa = usesIdfa
                self.versionString = versionString
            }

            public init(copyright: String? = nil, downloadable: Bool? = nil, earliestReleaseDate: Date? = nil, releaseType: AppStoreVersion.Attributes.ReleaseType? = nil, versionString: String? = nil) {
                self.copyright = copyright
                self.downloadable = downloadable
                self.earliestReleaseDate = earliestReleaseDate
                self.releaseType = releaseType
                self.versionString = versionString
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let build: Build?

            public init(build: Build? = nil) {
                self.build = build
            }

            public struct Build: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/relationships/build/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "builds" }

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
            }
        }
    }
}
