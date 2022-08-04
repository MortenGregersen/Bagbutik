import Foundation

/**
 # AppStoreVersionUpdateRequest
 The request body you use to update an App Store Version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest>
 */
public struct AppStoreVersionUpdateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # AppStoreVersionUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        public let id: String
        public var type: String { "appStoreVersions" }
        public var attributes: Attributes?
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
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
            case attributes
            case id
            case relationships
            case type
        }

        /**
         # AppStoreVersionUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var copyright: String?
            public var downloadable: Bool?
            public var earliestReleaseDate: Date?
            public var releaseType: AppStoreVersion.Attributes.ReleaseType?
            public var versionString: String?

            public init(copyright: String? = nil,
                        downloadable: Bool? = nil,
                        earliestReleaseDate: Date? = nil,
                        releaseType: AppStoreVersion.Attributes.ReleaseType? = nil,
                        versionString: String? = nil)
            {
                self.copyright = copyright
                self.downloadable = downloadable
                self.earliestReleaseDate = earliestReleaseDate
                self.releaseType = releaseType
                self.versionString = versionString
            }
        }

        /**
         # AppStoreVersionUpdateRequest.Data.Relationships
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The related Default App Clip Experiences resource.
            public var appClipDefaultExperience: AppClipDefaultExperience?
            public var build: Build?

            public init(appClipDefaultExperience: AppClipDefaultExperience? = nil,
                        build: Build? = nil)
            {
                self.appClipDefaultExperience = appClipDefaultExperience
                self.build = build
            }

            /**
             # AppStoreVersionUpdateRequest.Data.Relationships.AppClipDefaultExperience
             The relationship to the Default App Clip Default Experiences resource you set with the request that updates the App Store Versions resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/relationships/appclipdefaultexperience>
             */
            public struct AppClipDefaultExperience: Codable {
                /// The ID and type of the related Default App Clip Experiences resource.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 # AppStoreVersionUpdateRequest.Data.Relationships.AppClipDefaultExperience.Data
                 The type and ID of the Default App Clip Experiences resource that you’re relating with the App Store Versions resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/relationships/appclipdefaultexperience/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related Default App Clip Experiences resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipDefaultExperiences" }

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

            /**
             # AppStoreVersionUpdateRequest.Data.Relationships.Build
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/relationships/build>
             */
            public struct Build: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 # AppStoreVersionUpdateRequest.Data.Relationships.Build.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/relationships/build/data>
                 */
                public struct Data: Codable, Identifiable {
                    public let id: String
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
