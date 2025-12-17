import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the achievements for a Game Center group
     Update the achievements relationship for a specific Game Center group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterGroups-_id_-relationships-gameCenterAchievementsV2>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceGameCenterAchievementsV2ForGameCenterGroupV1(id: String,
                                                                    requestBody: GameCenterGroupGameCenterAchievementsV2LinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/relationships/gameCenterAchievementsV2",
            method: .patch,
            requestBody: requestBody)
    }
}
