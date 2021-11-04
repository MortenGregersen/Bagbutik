import Foundation

/**
 The request body you use to reserve an image asset that appears on the App Clip card of a default App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest>
 */
public struct AppClipHeaderImageCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipHeaderImages" }
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
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The filename of the image asset that appears on the App Clip card for the default App Clip experience.
            public let fileName: String
            /// The size of the image asset that appears on the App Clip card for the default App Clip experience.
            public let fileSize: Int

            public init(fileName: String, fileSize: Int) {
                self.fileName = fileName
                self.fileSize = fileSize
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization

            public init(appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization) {
                self.appClipDefaultExperienceLocalization = appClipDefaultExperienceLocalization
            }

            public struct AppClipDefaultExperienceLocalization: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest/data/relationships/appclipdefaultexperiencelocalization/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipDefaultExperienceLocalizations" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }
        }
    }
}
