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

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appStoreVersions" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
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

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let copyright: String?
            public let earliestReleaseDate: Date?
            public let platform: Platform
            public let releaseType: AppStoreVersion.Attributes.ReleaseType?
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
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let app: App
            public let appStoreVersionLocalizations: AppStoreVersionLocalizations?
            public let build: Build?

            public init(app: App, appStoreVersionLocalizations: AppStoreVersionLocalizations? = nil, build: Build? = nil) {
                self.app = app
                self.appStoreVersionLocalizations = appStoreVersionLocalizations
                self.build = build
            }

            public struct App: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/data/relationships/app/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "apps" }

                    public init(id: String) {
                        self.id = id
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
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/data/relationships/appstoreversionlocalizations/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appStoreVersionLocalizations" }

                    public init(id: String) {
                        self.id = id
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
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversioncreaterequest/data/relationships/build/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "builds" }

                    public init(id: String) {
                        self.id = id
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
