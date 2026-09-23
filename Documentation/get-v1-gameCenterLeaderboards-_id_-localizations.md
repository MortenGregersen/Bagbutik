<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 - 4.3.0"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterLeaderboards-_id_-localizations",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterLeaderboards-{}-localizations"
  },
  "title" : "List All Localizations for a Leaderboard"
}
-->

# List All Localizations for a Leaderboard

Get a list of localized metadata for a leaderboard.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/9b999364-308b-4ca3-8214-0af6cf5a6d51/localizations
```

**Response:**

```json
{
  “data” : [ {
    “type” : “gameCenterLeaderboardLocalizations”,
    “id” : “9b999364-308b-4ca3-8214-0af6cf5a6d51”,
    “attributes” : {
      “locale” : “en-CA”,
      “name” : “Best Latte Art”,
      “formatterOverride” : “INTEGER”,
      “formatterSuffix” : “points”,
      “formatterSuffixSingular” : “points”
    },
    “relationships” : {
      “gameCenterLeaderboardImage” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/9b999364-308b-4ca3-8214-0af6cf5a6d51/relationships/gameCenterLeaderboardImage”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/9b999364-308b-4ca3-8214-0af6cf5a6d51/gameCenterLeaderboardImage”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/9b999364-308b-4ca3-8214-0af6cf5a6d51”
    }
  }, {
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
  } ],
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/localizations”
  },
  “meta” : {
    “paging” : {
      “total” : 2,
      “limit” : 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)