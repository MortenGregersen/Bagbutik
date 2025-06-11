import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # PATCH /v1/gameCenterLeaderboards/{id}/relationships/activity

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboards-_id_-relationships-activity>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateActivityForGameCenterLeaderboardV1(id: String,
                                                         requestBody: GameCenterLeaderboardActivityLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboards/\(id)/relationships/activity",
            method: .patch,
            requestBody: requestBody)
    }
}
