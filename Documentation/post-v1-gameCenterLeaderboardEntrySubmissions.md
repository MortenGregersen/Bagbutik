<!--
{
  "availability" : [
    "App Store Connect API: 3.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-gameCenterLeaderboardEntrySubmissions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-gameCenterLeaderboardEntrySubmissions"
  },
  "title" : "Add a Score to a Leaderbaord"
}
-->

# Add a Score to a Leaderbaord

Add a new score for a player to a leaderboard.

## Discussion

Use the `preReleased` attribute to indicate whether the requested change applies to the game’s release version or its prerelease version. Set `preReleased` to `true` to indicate that the change applies to the game’s prerelease version.

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardEntrySubmissions

{
  “data”: {
    “type”: “gameCenterLeaderboardEntrySubmissions”,
    “attributes”: {
      “score”: “123”,
      “scopedPlayerId”: “A:_5f21e308073d18f9b3afdc37f646e851”,
      “bundleId”: “com.apple.sample.actionship”,
      “vendorIdentifier”: “com.apple.sample.actionship.shipssank”,
      "preReleased": false
    }
  }
}
```

**Response:**

```json
{
  “data”: {
    “type”: “gameCenterLeaderboardEntrySubmissions”,
    “id”: “3ef21559-006c-4308-831f-cd6cdd714863”,
    “attributes”: {
      “bundleId”: “com.apple.sample.actionship”,
      “challengeIds”: null,
      “context”: null,
      “scopedPlayerId”: “A:_5f21e308073d18f9b3afdc37f646e851”,
      “score”: “123”,
      “submittedDate”: null,
      “vendorIdentifier”: “com.apple.sample.actionship.shipssank”,
      "preReleased": false
    },
    “links”: {
      “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardEntrySubmissions/3ef21559-006c-4308-831f-cd6cdd714863”
    }
  },
  “links”: {
    “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardEntrySubmissions”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)