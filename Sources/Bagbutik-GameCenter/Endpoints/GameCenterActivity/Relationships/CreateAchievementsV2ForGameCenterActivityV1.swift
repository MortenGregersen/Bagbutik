import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add an achievement to a Game Center activity
     Add an achievement to a Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivities-_id_-relationships-achievementsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAchievementsV2ForGameCenterActivityV1(id: String,
                                                            requestBody: GameCenterActivityAchievementsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/achievementsV2",
            method: .post,
            requestBody: requestBody)
    }
}
