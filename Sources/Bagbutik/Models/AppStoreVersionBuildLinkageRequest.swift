import Foundation

/**
 The request body you use to attach a build to an App Store version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionbuildlinkagerequest>
 */
public struct AppStoreVersionBuildLinkageRequest: Codable, RequestBody {
    /// The object types and IDs of the related resources.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionbuildlinkagerequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "builds" }

        public init(id: String) {
            self.id = id
        }
    }
}
