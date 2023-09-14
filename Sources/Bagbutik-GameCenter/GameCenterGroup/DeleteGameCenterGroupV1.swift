import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a group
     Remove a group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_group>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterGroupV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterGroups/\(id)", method: .delete)
    }
}
