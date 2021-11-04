import Foundation

/**
 The request body you use to relate a released App Store version with a default App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencereleasewithappstoreversionlinkagerequest>
 */
public struct AppClipDefaultExperienceReleaseWithAppStoreVersionLinkageRequest: Codable, RequestBody {
    /// The object types and IDs of the related resources.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencereleasewithappstoreversionlinkagerequest/data>
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
