import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get the leaderboard set image ID for a Game Center leaderboard set localization

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSetLocalizations-_id_-relationships-gameCenterLeaderboardSetImage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getGameCenterLeaderboardSetImageIdsForGameCenterLeaderboardSetLocalizationV1(id: String) -> Request<GameCenterLeaderboardSetLocalizationGameCenterLeaderboardSetImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetLocalizations/\(id)/relationships/gameCenterLeaderboardSetImage",
            method: .get)
    }
}
