<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 - 4.3.0"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterLeaderboards-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterLeaderboards-{}"
  },
  "title" : "Read Leaderboard Information"
}
-->

# Read Leaderboard Information

Read information about a specific leaderboard.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829
```

**Response:**

```json
{
  “data” : {
    “type” : “gameCenterLeaderboards”,
    “id” : “843189c3-61a6-480a-a9d2-760a41299829”,
    “attributes” : {
      “defaultFormatter” : “INTEGER”,
      “referenceName” : “Latte Art”,
      “vendorIdentifier” : “LA_LB”,
      “submissionType” : “BEST_SCORE”,
      “scoreSortType” : “DESC”,
      “scoreRangeStart” : “1”,
      “scoreRangeEnd” : “100”,
      “recurrenceStartDate” : “2023-09-02T07:00:00Z”,
      “recurrenceDuration” : “PT168H”,
      “recurrenceRule” : “FREQ=DAILY;INTERVAL=7”,
      “archived” : false
    },
    “relationships” : {
      “groupLeaderboard” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/relationships/groupLeaderboard”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/groupLeaderboard”
        }
      },
      “localizations” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/relationships/localizations”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/localizations”
        }
      },
      “releases” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/relationships/releases”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/releases”
        }
      },
      “leaderboardScores” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/relationships/leaderboardScores”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829/leaderboardScores”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829”
    }
  },
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/843189c3-61a6-480a-a9d2-760a41299829”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)