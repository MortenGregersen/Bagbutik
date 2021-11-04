import Foundation

/**
 The request body you use to create an App Preview Set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest>
 */
public struct AppPreviewSetCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appPreviewSets" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships?

        public init(attributes: Attributes, relationships: Relationships? = nil) {
            self.attributes = attributes
            self.relationships = relationships
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let previewType: PreviewType

            public init(previewType: PreviewType) {
                self.previewType = previewType
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appStoreVersionLocalization: AppStoreVersionLocalization?

            public init(appStoreVersionLocalization: AppStoreVersionLocalization? = nil) {
                self.appStoreVersionLocalization = appStoreVersionLocalization
            }

            public struct AppStoreVersionLocalization: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest/data/relationships/appstoreversionlocalization/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appStoreVersionLocalizations" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }
        }
    }
}
