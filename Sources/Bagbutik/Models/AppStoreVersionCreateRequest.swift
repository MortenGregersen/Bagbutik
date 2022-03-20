import Foundation

/**
 The request body you use to create an App Store Version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest>
 */
public struct AppStoreVersionCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public var type: String { "appStoreVersions" }
        ///
        public let attributes: Attributes
        ///
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
            case relationships
        }

        public struct Attributes: Codable {
            public var copyright: String?
            public var earliestReleaseDate: Date?
            public let platform: Platform
            @NullCodable public var releaseType: AppStoreVersion.Attributes.ReleaseType?
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var usesIdfa: Bool? = nil
            public let versionString: String

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(copyright: String? = nil, earliestReleaseDate: Date? = nil, platform: Platform, releaseType: AppStoreVersion.Attributes.ReleaseType? = nil, usesIdfa: Bool? = nil, versionString: String) {
                self.copyright = copyright
                self.earliestReleaseDate = earliestReleaseDate
                self.platform = platform
                self.releaseType = releaseType
                self.usesIdfa = usesIdfa
                self.versionString = versionString
            }

            public init(copyright: String? = nil, earliestReleaseDate: Date? = nil, platform: Platform, releaseType: AppStoreVersion.Attributes.ReleaseType? = nil, versionString: String) {
                self.copyright = copyright
                self.earliestReleaseDate = earliestReleaseDate
                self.platform = platform
                self.releaseType = releaseType
                self.versionString = versionString
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/properties/data/properties/relationships>
         */
        public struct Relationships: Codable {
            public let app: App
            @NullCodable public var appStoreVersionLocalizations: AppStoreVersionLocalizations?
            @NullCodable public var build: Build?

            public init(app: App, appStoreVersionLocalizations: AppStoreVersionLocalizations? = nil, build: Build? = nil) {
                self.app = app
                self.appStoreVersionLocalizations = appStoreVersionLocalizations
                self.build = build
            }

            public struct App: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/properties/data/properties/relationships/properties/app/properties/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
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
            }

            public struct AppStoreVersionLocalizations: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/properties/data/properties/relationships/properties/appstoreversionlocalizations/properties/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appStoreVersionLocalizations" }

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

            public struct Build: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/properties/data/properties/relationships/properties/build/properties/data>
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
