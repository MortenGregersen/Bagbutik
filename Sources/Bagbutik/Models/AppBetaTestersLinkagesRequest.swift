import Foundation

/**
 A request body you use to remove beta testers from an app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appbetatesterslinkagesrequest>
 */
public struct AppBetaTestersLinkagesRequest: Codable, RequestBody {
    /// The object types and IDs of the related resources.
    public let data: [Data]

    public init(data: [Data]) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appbetatesterslinkagesrequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaTesters" }

        public init(id: String) {
            self.id = id
        }
    }
}
