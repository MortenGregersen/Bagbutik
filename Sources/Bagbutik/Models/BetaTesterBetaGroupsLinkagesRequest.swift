import Foundation

/**
 A request body you use to add or remove beta groups from a beta tester.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatesterbetagroupslinkagesrequest>
 */
public struct BetaTesterBetaGroupsLinkagesRequest: Codable, RequestBody {
    /// The object types and IDs of the related resources.
    public let data: [Data]

    public init(data: [Data]) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betatesterbetagroupslinkagesrequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaGroups" }

        public init(id: String) {
            self.id = id
        }
    }
}
