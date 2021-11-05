import Foundation

/**
 A request body you use to reorder the app previews in a preview set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetapppreviewslinkagesrequest>
 */
public struct AppPreviewSetAppPreviewsLinkagesRequest: Codable, RequestBody {
    /// The object types and IDs of the related resources.
    public let data: [Data]

    public init(data: [Data]) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetapppreviewslinkagesrequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appPreviews" }

        public init(id: String) {
            self.id = id
        }
    }
}
