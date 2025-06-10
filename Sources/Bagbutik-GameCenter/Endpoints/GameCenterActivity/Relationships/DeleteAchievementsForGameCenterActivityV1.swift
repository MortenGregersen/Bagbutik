import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove an achievement from an activity
     Remove the relationship between an achievement and a Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterActivities-_id_-relationships-achievements>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAchievementsForGameCenterActivityV1(id: String,
                                                          requestBody: GameCenterActivityAchievementsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/achievements",
            method: .delete,
            requestBody: requestBody)
    }
}
