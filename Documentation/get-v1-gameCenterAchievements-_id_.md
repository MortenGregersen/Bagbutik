<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterAchievements-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterAchievements-{}"
  },
  "title" : "Read Achievement Information"
}
-->

# Read Achievement Information

Read information about a specific Game Center achievement.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterAchievements
```

**Response:**

```json
{
  “data” : [ {
    “type” : “gameCenterAchievements”,
    “id” : “d3888910-d5fd-4737-b903-2f54356ce682”,
    “attributes” : {
      “referenceName” : “Ristretto”,
      “vendorIdentifier” : “RISTRETTO_ACH”,
      “points” : 0,
      “showBeforeEarned” : false,
      “repeatable” : false,
      “archived” : false
    },
    “relationships” : {
      “groupAchievement” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/d3888910-d5fd-4737-b903-2f54356ce682/relationships/groupAchievement”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/d3888910-d5fd-4737-b903-2f54356ce682/groupAchievement”
        }
      },
      “localizations” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/d3888910-d5fd-4737-b903-2f54356ce682/relationships/localizations”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/d3888910-d5fd-4737-b903-2f54356ce682/localizations”
        }
      },
      “releases” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/d3888910-d5fd-4737-b903-2f54356ce682/relationships/releases”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/d3888910-d5fd-4737-b903-2f54356ce682/releases”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/d3888910-d5fd-4737-b903-2f54356ce682”
    }
  } ],
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterAchievements”
  },
  “meta” : {
    “paging” : {
      “total” : 1,
      “limit” : 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)