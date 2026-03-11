import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the achievements for a Game Center activity
     Update the relationship between achievements and a specific Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivities-_id_-relationships-achievements>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createAchievementsForGameCenterActivityV1(id: String,
                                                          requestBody: GameCenterActivityAchievementsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/relationships/achievements",
            method: .post,
            requestBody: requestBody)
    }
}
