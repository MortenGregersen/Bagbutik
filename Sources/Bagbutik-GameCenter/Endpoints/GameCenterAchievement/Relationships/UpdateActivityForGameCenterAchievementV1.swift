import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the activity for a Game Center achievement

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterAchievements-_id_-relationships-activity>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateActivityForGameCenterAchievementV1(id: String,
                                                         requestBody: GameCenterAchievementActivityLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievements/\(id)/relationships/activity",
            method: .patch,
            requestBody: requestBody)
    }
}
