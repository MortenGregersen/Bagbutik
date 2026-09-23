<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GameCenterLeaderboardFormatter",
  "metadataVersion" : "0.1.0",
  "role" : "Type",
  "symbol" : {
    "kind" : "Type",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "data:app_store_connect_api:GameCenterLeaderboardFormatter"
  },
  "title" : "GameCenterLeaderboardFormatter"
}
-->

# GameCenterLeaderboardFormatter

The values you can select to describe the format of a leaderboard.

```
string GameCenterLeaderboardFormatter
```

## Discussion

### Discussion

Leaderboard formatters allow you to specify the unit of measurement for a Game Center leaderboard. There is a new required attribute `defaultFormatter` when using [`Create a Leaderboard`](/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboards) which will give all your localizations the same formatter. You can also optionally use `formatterOverride` to override a specific leaderboard localization when calling [`Create a Leaderboard Localization`](/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboardLocalizations) or [`Modify a Leaderboard Localization`](/documentation/AppStoreConnectAPI/PATCH-v1-gameCenterLeaderboardLocalizations-_id_).

Before App Store Connect API version 3.0, formatters were based on localizations and were required for each localization. Legacy leaderboards created before the new addition of the Game Center APIs will not have a `defaultFormatter` value, the value would be `null` in this case. Any localizations created before the new addition of the Game Center APIs will always have a `formatterOverride`.

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)