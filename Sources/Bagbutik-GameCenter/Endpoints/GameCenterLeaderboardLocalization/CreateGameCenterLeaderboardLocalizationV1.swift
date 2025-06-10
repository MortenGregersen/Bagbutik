import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard localization
     Add a new leaderboard localization.

     Use leaderboard formatters to specify the unit of measurement for a Game Center leaderboard. There is a new required attribute `defaultFormatter` when you use [Create a leaderboard](https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gamecenterleaderboards), which gives all your localizations the same formatter. You can also optionally use `formatterOverride` to override a specific leaderboard localization when calling [Create a leaderboard localization](https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gamecenterleaderboardlocalizations) or [Modify a leaderboard localization](https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gamecenterleaderboardlocalizations-_id_).
     Before App Store Connect API version 3.0, formatters were based on localizations and were required for each localization. Legacy leaderboards created before the new addition of the Game Center APIs will not have a `defaultFormatter` value, the value would be `null` in this case. Any localizations created before the new addition of the Game Center APIs will always have a `formatterOverride`.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardLocalizations>

     - Parameter requestBody: GameCenterLeaderboardLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardLocalizationV1(requestBody: GameCenterLeaderboardLocalizationCreateRequest) -> Request<GameCenterLeaderboardLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
