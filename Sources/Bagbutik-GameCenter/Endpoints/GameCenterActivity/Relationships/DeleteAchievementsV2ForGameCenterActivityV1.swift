import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove an achievement
     Remove an achievement from a Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterActivities-_id_-relationships-achievementsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAchievementsV2ForGameCenterActivityV1(id: String,
                                                            requestBody: GameCenterActivityAchievementsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/achievementsV2",
            method: .delete,
            requestBody: requestBody)
    }
}
