import Foundation

/**
 The request body you use to attach a default App Clip experience to an App Store version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionappclipdefaultexperiencelinkagerequest>
 */
public struct AppStoreVersionAppClipDefaultExperienceLinkageRequest: Codable, RequestBody {
    /// The object types and IDs of the related resources.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionappclipdefaultexperiencelinkagerequest/data>
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