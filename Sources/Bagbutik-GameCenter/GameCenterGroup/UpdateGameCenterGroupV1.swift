import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a group
     Edit the reference name for a group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterGroups-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterGroupV1(id: String,
                                        requestBody: GameCenterGroupUpdateRequest) -> Request<GameCenterGroupResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterGroups/\(id)", method: .patch, requestBody: requestBody)
    }
}
