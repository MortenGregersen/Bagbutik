import Foundation

/**
 The request body you use to update an App Preview.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewupdaterequest>
 */
public struct AppPreviewUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appPreviews" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let previewFrameTimeCode: String?
            public let sourceFileChecksum: String?
            public let uploaded: Bool?

            public init(previewFrameTimeCode: String? = nil, sourceFileChecksum: String? = nil, uploaded: Bool? = nil) {
                self.previewFrameTimeCode = previewFrameTimeCode
                self.sourceFileChecksum = sourceFileChecksum
                self.uploaded = uploaded
            }
        }
    }
}
