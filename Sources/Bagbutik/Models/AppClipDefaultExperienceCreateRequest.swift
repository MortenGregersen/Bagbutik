import Foundation

/**
 The request body you use to create a default App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest>
 */
public struct AppClipDefaultExperienceCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipDefaultExperiences" }
        /// The resource's attributes.
        public let attributes: Attributes?
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships

        public init(attributes: Attributes? = nil, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The call-to-action verb that appears on the App Clip card.
            public let action: AppClipAction?

            public init(action: AppClipAction? = nil) {
                self.action = action
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appClip: AppClip
            public let appClipDefaultExperienceTemplate: AppClipDefaultExperienceTemplate?
            public let releaseWithAppStoreVersion: ReleaseWithAppStoreVersion?

            public init(appClip: AppClip, appClipDefaultExperienceTemplate: AppClipDefaultExperienceTemplate? = nil, releaseWithAppStoreVersion: ReleaseWithAppStoreVersion? = nil) {
                self.appClip = appClip
                self.appClipDefaultExperienceTemplate = appClipDefaultExperienceTemplate
                self.releaseWithAppStoreVersion = releaseWithAppStoreVersion
            }

            public struct AppClip: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships/appclip/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClips" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }

            public struct AppClipDefaultExperienceTemplate: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships/appclipdefaultexperiencetemplate/data>
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

            public struct ReleaseWithAppStoreVersion: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships/releasewithappstoreversion/data>
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