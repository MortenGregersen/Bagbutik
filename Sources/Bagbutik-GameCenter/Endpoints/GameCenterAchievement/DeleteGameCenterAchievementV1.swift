import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an achievement
     Delete a specific achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterAchievements-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterAchievementV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievements/\(id)",
            method: .delete)
    }
}
