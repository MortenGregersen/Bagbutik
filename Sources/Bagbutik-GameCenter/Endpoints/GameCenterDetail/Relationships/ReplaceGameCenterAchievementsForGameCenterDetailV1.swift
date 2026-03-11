import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify associated achievements
     Modify the achievements for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterDetails-_id_-relationships-gameCenterAchievements>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func replaceGameCenterAchievementsForGameCenterDetailV1(id: String,
                                                                   requestBody: GameCenterDetailGameCenterAchievementsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/gameCenterAchievements",
            method: .patch,
            requestBody: requestBody)
    }
}
