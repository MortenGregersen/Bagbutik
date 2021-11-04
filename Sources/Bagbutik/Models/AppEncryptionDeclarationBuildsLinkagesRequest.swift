import Foundation

/**
 A request body you use to add builds to an app encryption declaration.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclarationbuildslinkagesrequest>
 */
public struct AppEncryptionDeclarationBuildsLinkagesRequest: Codable, RequestBody {
    /// The object types and IDs of the related resources.
    public let data: [Data]

    public init(data: [Data]) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclarationbuildslinkagesrequest/data>
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
