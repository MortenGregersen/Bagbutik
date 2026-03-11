import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an achievement localization
     Delete localization metadata that’s associated with an achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterAchievementLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func deleteGameCenterAchievementLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementLocalizations/\(id)",
            method: .delete)
    }
}
