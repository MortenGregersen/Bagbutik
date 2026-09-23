<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 - 4.3.0"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterAchievements-_id_-releases",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterAchievements-{}-releases"
  },
  "title" : "Read Release Information for an Achievement"
}
-->

# Read Release Information for an Achievement

Read the state of an achievement release and related information.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/4a6bcd3d-0325-418b-3bbf-671bd15be8c6/releases
```

**Response:**

```json
{
  “data” : [ {
    “type” : “gameCenterAchievementReleases”,
    “id” : “be3bd01f-fd78-9093-63a7-bc25ff890eb2”,
    “attributes” : {
      “live” : true
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/be3bd01f-fd78-9093-63a7-bc25ff890eb2”
    }
  } ],
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/4a6bcd3d-0325-418b-3bbf-671bd15be8c6/releases”
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