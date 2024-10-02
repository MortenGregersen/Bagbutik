import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a group
     Add a new group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterGroups>

     - Parameter requestBody: GameCenterGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterGroupV1(requestBody: GameCenterGroupCreateRequest) -> Request<GameCenterGroupResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterGroups", method: .post, requestBody: requestBody)
    }
}
