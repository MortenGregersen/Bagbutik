import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # List localization IDs for a Game Center achievement

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAchievements-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listLocalizationIdsForGameCenterAchievementV1(id: String,
                                                              limit: Int? = nil) -> Request<GameCenterAchievementLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievements/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
