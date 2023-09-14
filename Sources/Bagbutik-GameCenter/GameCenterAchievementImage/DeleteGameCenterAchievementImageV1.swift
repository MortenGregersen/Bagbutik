import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an achievement image
     Delete an image that’s associated with an achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_achievement_image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterAchievementImageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterAchievementImages/\(id)", method: .delete)
    }
}
