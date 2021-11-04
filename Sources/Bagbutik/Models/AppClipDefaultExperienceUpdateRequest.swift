import Foundation

/**
 The request body you use to update a default App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperienceupdaterequest>
 */
public struct AppClipDefaultExperienceUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperienceupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appClipDefaultExperiences" }
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
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperienceupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The call-to-action verb that appears on the App Clip card.
            public let action: AppClipAction?

            public init(action: AppClipAction? = nil) {
                self.action = action
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperienceupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let releaseWithAppStoreVersion: ReleaseWithAppStoreVersion?

            public init(releaseWithAppStoreVersion: ReleaseWithAppStoreVersion? = nil) {
                self.releaseWithAppStoreVersion = releaseWithAppStoreVersion
            }

            public struct ReleaseWithAppStoreVersion: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperienceupdaterequest/data/relationships/releasewithappstoreversion/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appStoreVersions" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }
        }
    }
}
