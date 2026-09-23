<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterLeaderboardLocalizations-_id_-gameCenterLeaderboardImage",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterLeaderboardLocalizations-{}-gameCenterLeaderboardImage"
  },
  "title" : "Read the Image for a Leaderboard Localization"
}
-->

# Read the Image for a Leaderboard Localization

Get information about the image associated with a leaderboard localization.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b/gameCenterLeaderboardImage
```

**Response:**

```json
{
  “data” : {
    “type” : “gameCenterLeaderboardImages”,
    “id” : “482f6124-4570-43a0-aa5e-ec289ba6faf8”,
    “attributes” : {
      “fileSize” : 357407,
      “fileName” : “coffee2.png”,
      “imageAsset” : {
        “templateUrl” : “https://isq11.mzstatic.com/image/thumb/PurpleSource113/v4/ad/e2/7b/ade27bd0-013d-86ef-2748-9d63b53e781e/482f6124-4570-43a0-aa5e-ec289ba6faf8_coffee2.png/{w}x{h}bb.{f}”,
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
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardImages/482f6124-4570-43a0-aa5e-ec289ba6faf8”
    }
  },
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardLocalizations/5a75be8c-225a-4fd4-b51f-d33876c2c79b/gameCenterLeaderboardImage”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)