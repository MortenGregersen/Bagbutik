<!--
{
  "availability" : [
    "App Store Connect API: 3.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-gameCenterPlayerAchievementSubmissions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-gameCenterPlayerAchievementSubmissions"
  },
  "title" : "Add a Player's Score"
}
-->

# Add a Player's Score

Add a new entry for a player’s score for a Game Center achievement.

## Discussion

Use the `preReleased` attribute to indicate whether the requested change applies to the game’s release version or its prerelease version. Set `preReleased` to `true` to indicate that the change applies to the game’s prerelease version.

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/gameCenterPlayerAchievementSubmissions
{
  “data”: {
    “type”: “gameCenterPlayerAchievementSubmissions”,
    “attributes”: {
      “percentageAchieved”: 30,
      “scopedPlayerId”: “A:_5f21e308073d18f9b3afdc37f646e851”,
      “bundleId”: “com.apple.sample.actionship”,
      “vendorIdentifier”: “com.apple.sample.actionship.perfectaim”,
      "preReleased": true
    }
  }
}
```

**Response:**

```json
{
  “data”: {
    “type”: “gameCenterPlayerAchievementSubmissions”,
    “id”: “d9f8b8dd-6050-45c6-a8e3-c6b97c186583”,
    “attributes”: {
      “bundleId”: “com.apple.sample.actionship”,
      “challengeIds”: null,
      “percentageAchieved”: 30,
      “scopedPlayerId”: “A:_5f21e308073d18f9b3afdc37f646e851”,
      “submittedDate”: null,
      “vendorIdentifier”: “com.apple.sample.actionship.perfectaim”,
      "preReleased": true
    },
    “links”: {
      “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterPlayerAchievementSubmissions/d9f8b8dd-6050-45c6-a8e3-c6b97c186583”
    }
  },
  “links”: {
    “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterPlayerAchievementSubmissions”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)