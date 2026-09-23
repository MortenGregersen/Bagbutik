<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterDetails-_id_-achievementReleases",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterDetails-{}-achievementReleases"
  },
  "title" : "List achievement releases"
}
-->

# List achievement releases

Read information about the achievement releases for specific Game Center detail.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/gameCenterDetails/83b895ff-7bfe-5056-1208-ffd0d6a74e46/achievementReleases?limit=5
```

**Response:**

```json
{
  “data” : [ {
    “type” : “gameCenterAchievementReleases”,
    “id” : “24d3a649-59e7-7d15-f794-3abf4e44d0a8”,
    “attributes” : {
      “live” : true
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/24d3a649-59e7-7d15-f794-3abf4e44d0a8”
    }
  }, {
    “type” : “gameCenterAchievementReleases”,
    “id” : “71002ec8-e7e0-fc5f-456b-c2b563b3294d”,
    “attributes” : {
      “live” : true
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/71002ec8-e7e0-fc5f-456b-c2b563b3294d”
    }
  }, {
    “type” : “gameCenterAchievementReleases”,
    “id” : “2025e5d2-d60f-7504-099a-c6d7df11292d”,
    “attributes” : {
      “live” : true
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/2025e5d2-d60f-7504-099a-c6d7df11292d”
    }
  }, {
    “type” : “gameCenterAchievementReleases”,
    “id” : “b9d99cb3-c5f4-3050-f4dc-d6f4b749cba3”,
    “attributes” : {
      “live” : true
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/b9d99cb3-c5f4-3050-f4dc-d6f4b749cba3”
    }
  }, {
    “type” : “gameCenterAchievementReleases”,
    “id” : “701b76ef-9fe5-f1e7-02ea-b875fe27d0fd”,
    “attributes” : {
      “live” : true
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/701b76ef-9fe5-f1e7-02ea-b875fe27d0fd”
    }
  },
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/83b895ff-7bfe-5056-1208-ffd0d6a74e46/achievementReleases?limit=5”
  },
  “meta” : {
    “paging” : {
      “total” : 35,
      “limit” : 5
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)