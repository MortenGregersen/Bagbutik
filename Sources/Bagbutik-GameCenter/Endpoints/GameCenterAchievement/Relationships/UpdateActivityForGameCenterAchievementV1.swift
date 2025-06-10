import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # PATCH /v1/gameCenterAchievements/{id}/relationships/activity

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterAchievements-_id_-relationships-activity>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateActivityForGameCenterAchievementV1(id: String,
                                                         requestBody: GameCenterAchievementActivityLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievements/\(id)/relationships/activity",
            method: .patch,
            requestBody: requestBody)
    }
}
