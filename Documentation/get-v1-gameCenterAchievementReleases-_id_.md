<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterAchievementReleases-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterAchievementReleases-{}"
  },
  "title" : "Read game center achievement release information"
}
-->

# Read game center achievement release information

Read the state of a specific achievement release.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/b46850bc-ba02-3793-4ea7-36738b92440a
```

**Response:**

```json
{
  “data” : {
    “type” : “gameCenterAchievementReleases”,
    “id” : “b46850bc-ba02-3793-4ea7-36738b92440a”,
    “attributes” : {
      “live” : true
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/b46850bc-ba02-3793-4ea7-36738b92440a”
    }
  },
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementReleases/b46850bc-ba02-3793-4ea7-36738b92440a”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)