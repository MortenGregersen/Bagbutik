import Foundation

/**
 A request body you use to add or remove compatible versions from a Game Center-enabled version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversioncompatibleversionslinkagesrequest>
 */
public struct GameCenterEnabledVersionCompatibleVersionsLinkagesRequest: Codable, RequestBody {
    /// The object types and IDs of the related resources.
    public let data: [Data]

    public init(data: [Data]) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversioncompatibleversionslinkagesrequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "gameCenterEnabledVersions" }

        public init(id: String) {
            self.id = id
        }
    }
}
