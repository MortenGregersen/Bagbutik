import Foundation

/**
 The request body you use to create a Default App Clip Experience Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest>
 */
public struct AppClipDefaultExperienceLocalizationCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipDefaultExperienceLocalizations" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The specified locale.
            public let locale: String
            /// The subtitle that appears on the App Clip card for the default App Clip experience.
            public let subtitle: String?

            public init(locale: String, subtitle: String? = nil) {
                self.locale = locale
                self.subtitle = subtitle
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appClipDefaultExperience: AppClipDefaultExperience

            public init(appClipDefaultExperience: AppClipDefaultExperience) {
                self.appClipDefaultExperience = appClipDefaultExperience
            }

            public struct AppClipDefaultExperience: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationcreaterequest/data/relationships/appclipdefaultexperience/data>
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
        }
    }
}