<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterAchievementImages-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterAchievementImages-{}"
  },
  "title" : "Read Achievement Image Information"
}
-->

# Read Achievement Image Information

Get information about an achievement image and its upload and processing status.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/gameCenterAchievementImages/38e6d9a7-9cbf-45f8-8246-1ef4728aecda
```

**Response:**

```json
{
  “data” : {
    “type” : “gameCenterAchievementImages”,
    “id” : “38e6d9a7-9cbf-45f8-8246-1ef4728aecda”,
    “attributes” : {
      “fileSize” : 357407,
      “fileName” : “coffee1.png”,
      “imageAsset” : {
        “templateUrl” : “https://isq11.mzstatic.com/image/thumb/PurpleSource113/v4/64/14/07/641407e3-602f-ce23-10b8-c91b1762986c/38e6d9a7-9cbf-45f8-8246-1ef4728aecda_coffee1.png/{w}x{h}bb.{f}”,
        “width” : 512,
        “height” : 512
      },
      “uploadOperations” : [ ],
      “assetDeliveryState” : {
        “errors” : null,
        “warnings” : null,
        “state” : “COMPLETE”
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementImages/38e6d9a7-9cbf-45f8-8246-1ef4728aecda”
    }
  },
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievementImages/38e6d9a7-9cbf-45f8-8246-1ef4728aecda”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)