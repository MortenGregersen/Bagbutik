<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-gameCenterMatchmakingTeams",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-gameCenterMatchmakingTeams"
  },
  "title" : "Create a Team"
}
-->

# Create a Team

Add a game-specific team to a rule set.

## Discussion

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTeams
{
    “data”: {
        “type”: “gameCenterMatchmakingTeams”,
        “attributes”: {
            “minPlayers”: 2,
            “maxPlayers”: 4,
            “referenceName”: “blue”
        },
        “relationships”: {
            “ruleSet”: {
                “data”: {
                    “type”: “gameCenterMatchmakingRuleSets”,
                    “id”: “50d7eed2-8016-441a-a919-db3d863f433c”
                }
            }
        }
    }
}
```

**Response:**

```json
{
    “data”: {
        “type”: “gameCenterMatchmakingTeams”,
        “id”: “2a68632b-0129-4c07-8e84-6da57a76499d”,
        “attributes”: {
            “referenceName”: “blue”,
            “minPlayers”: 2,
            “maxPlayers”: 4
        },
        “links”: {
            “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTeams/2a68632b-0129-4c07-8e84-6da57a76499d”
        }
    },
    “links”: {
        “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTeams”
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)