import Foundation

/**
 The request body you use to attach an app encryption declaration to a build.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildappencryptiondeclarationlinkagerequest>
 */
public struct BuildAppEncryptionDeclarationLinkageRequest: Codable, RequestBody {
    /// The object types and IDs of the related resources.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildappencryptiondeclarationlinkagerequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appEncryptionDeclarations" }

        public init(id: String) {
            self.id = id
        }
    }
}
