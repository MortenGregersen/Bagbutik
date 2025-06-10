import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an activity
     Create an activity for your Game Center detail or Game Center group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivities>

     - Parameter requestBody: GameCenterActivity representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterActivityV1(requestBody: GameCenterActivityCreateRequest) -> Request<GameCenterActivityResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities",
            method: .post,
            requestBody: requestBody)
    }
}
