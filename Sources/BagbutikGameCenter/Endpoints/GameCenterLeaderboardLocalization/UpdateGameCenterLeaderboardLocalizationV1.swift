import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Leaderboard Localization

     Edit a leaderboard localization.

     ## Discussion

     Use leaderboard formatters to specify the unit of measurement for a Game Center leaderboard. There is a new required attribute `defaultFormatter` when you use [`Create a Leaderboard`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboards), which gives all your localizations the same formatter. You can also optionally use `formatterOverride` to override a specific leaderboard localization when calling [`Create a Leaderboard Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboardLocalizations) or [`Modify a Leaderboard Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/PATCH-v1-gameCenterLeaderboardLocalizations-_id_).

     Before App Store Connect API version 3.0, formatters were based on localizations and were required for each localization. Legacy leaderboards created before the new addition of the Game Center APIs will not have a `defaultFormatter` value, the value would be `null` in this case. Any localizations created before the new addition of the Game Center APIs will always have a `formatterOverride`.

     ### Example Request and Response

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b -d
     {
         “data”: {
             “type”: “gameCenterLeaderboardLocalizations”,
             “id”: “5a75be8c-225a-4fd4-b51f-d33876c2c79b”,
             “attributes”: {
                 “formatterSuffixSingular”: “point”
             }
         }
     }
     ```

     **Response:**

     ```json
     {
       “data” : {
         “type” : “gameCenterLeaderboardLocalizations”,
         “id” : “5a75be8c-225a-4fd4-b51f-d33876c2c79b”,
         “attributes” : {
           “locale” : “en-US”,
           “name” : “Best Latte Art”,
           “formatterOverride” : “INTEGER”,
           “formatterSuffix” : “points”,
           “formatterSuffixSingular” : “point”
         },
         “relationships” : {
           “gameCenterLeaderboardImage” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b/relationships/gameCenterLeaderboardImage”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b/gameCenterLeaderboardImage”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b”
         }
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboardLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateGameCenterLeaderboardLocalizationV1(id: String,
                                                          requestBody: GameCenterLeaderboardLocalizationUpdateRequest) -> Request<GameCenterLeaderboardLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
