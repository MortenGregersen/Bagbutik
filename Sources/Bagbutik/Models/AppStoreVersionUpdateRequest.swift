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
            public let appClipDefaultExperience: AppClipDefaultExperience?
            public let build: Build?

            public init(appClipDefaultExperience: AppClipDefaultExperience? = nil, build: Build? = nil) {
                self.appClipDefaultExperience = appClipDefaultExperience
                self.build = build
            }

            public struct AppClipDefaultExperience: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest/data/relationships/appclipdefaultexperience/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipDefaultExperiences" }

                    public init(id: String) {
                        self.id = id
                    }
                }
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
                }
            }
        }
    }
}
