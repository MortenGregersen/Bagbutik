import Foundation

/**
 The request body you use to create an App Clip App Store Review Detail.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest>
 */
public struct AppClipAppStoreReviewDetailCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipAppStoreReviewDetails" }
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
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// An array of invocation URLs for your App Clip.
            public let invocationUrls: String?

            public init(invocationUrls: String? = nil) {
                self.invocationUrls = invocationUrls
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data/relationships>
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
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data/relationships/appclipdefaultexperience/data>
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