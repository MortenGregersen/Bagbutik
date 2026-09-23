<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v1-gameCenterLeaderboards-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v1-gameCenterLeaderboards-{}"
  },
  "title" : "Edit a Leaderboard"
}
-->

# Edit a Leaderboard

Modify the details of a leaderboard.

## Overview

### Discussion

Use leaderboard formatters to specify the unit of measurement for a Game Center leaderboard. There is a new required attribute `defaultFormatter` when you use [`Create a Leaderboard`](/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboards), which gives all your localizations the same formatter. You can also optionally use `formatterOverride` to override a specific leaderboard localization when calling [`Create a Leaderboard Localization`](/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboardLocalizations) or [`Modify a Leaderboard Localization`](/documentation/AppStoreConnectAPI/PATCH-v1-gameCenterLeaderboardLocalizations-_id_).

Before App Store Connect API version 3.0, formatters were based on localizations and were required for each localization. Legacy leaderboards created before the new addition of the Game Center APIs will not have a `defaultFormatter` value, the value would be `null` in this case. Any localizations created before the new addition of the Game Center APIs will always have a `formatterOverride`.

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)