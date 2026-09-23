<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 - 4.3.0"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboardLocalizations",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-gameCenterLeaderboardLocalizations"
  },
  "title" : "Create a Leaderboard Localization"
}
-->

# Create a Leaderboard Localization

Add a new leaderboard localization.

## Discussion

Use leaderboard formatters to specify the unit of measurement for a Game Center leaderboard. There is a new required attribute `defaultFormatter` when you use [`Create a Leaderboard`](/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboards), which gives all your localizations the same formatter. You can also optionally use `formatterOverride` to override a specific leaderboard localization when calling [`Create a Leaderboard Localization`](/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboardLocalizations) or [`Modify a Leaderboard Localization`](/documentation/AppStoreConnectAPI/PATCH-v1-gameCenterLeaderboardLocalizations-_id_).

Before App Store Connect API version 3.0, formatters were based on localizations and were required for each localization. Legacy leaderboards created before the new addition of the Game Center APIs will not have a `defaultFormatter` value, the value would be `null` in this case. Any localizations created before the new addition of the Game Center APIs will always have a `formatterOverride`.

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations -d 
{
    “data”: {
        “type”: “gameCenterLeaderboardLocalizations”,
        “attributes”: {
            “locale”: “en-US”,
            “name”: “Best Latte Art”,
            “formatterOverride”: “INTEGER”,
            “formatterSuffix”: “points”,
            “formatterSuffixSingular”: “point”
        },
        “relationships”: {
            “gameCenterLeaderboard”: {
                “data”: {
                    “type”: “gameCenterLeaderboards”,
                    “id”: “843189c3-61a6-480a-a9d2-760a41299829”
                }
            }
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
      “formatterSuffixSingular” : “points”
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
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)