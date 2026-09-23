<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-gameCenterMatchmakingRuleSets",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-gameCenterMatchmakingRuleSets"
  },
  "title" : "Create a Rule Set"
}
-->

# Create a Rule Set

Create a rule set to contain matchmaking rules and teams.

## Discussion

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1//gameCenterMatchmakingRuleSets
{
    “data”: {
        “type”: “gameCenterMatchmakingRuleSets”,
        “attributes”: {
            “referenceName”: “com.example.mygame.GameSettingsRuleSet”,
            “ruleLanguageVersion”: 1,
            “minPlayers”: 2,
            “maxPlayers”: 4
        },
        “relationships”: {}
    }
}
```

**Response:**

```json
{
    “data”: {
        “type”: “gameCenterMatchmakingRuleSets”,
        “id”: “7353266e-8c6f-4cbe-8f0f-5108332a1146”,
        “attributes”: {
            “referenceName”: “com.example.mygame.GameSettingsRuleSet”,
            “ruleLanguageVersion”: 1,
            “minPlayers”: 2,
            “maxPlayers”: 4
        },
        “relationships”: {
            “teams”: {
                “links”: {
                    “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSets/7353266e-8c6f-4cbe-8f0f-5108332a1146/relationships/teams”,
                    “related”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSets/7353266e-8c6f-4cbe-8f0f-5108332a1146/teams”
                }
            },
            “rules”: {
                “links”: {
                    “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSets/7353266e-8c6f-4cbe-8f0f-5108332a1146/relationships/rules”,
                    “related”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSets/7353266e-8c6f-4cbe-8f0f-5108332a1146/rules”
                }
            },
            “matchmakingQueues”: {
                “links”: {
                    “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSets/7353266e-8c6f-4cbe-8f0f-5108332a1146/relationships/matchmakingQueues”,
                    “related”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSets/7353266e-8c6f-4cbe-8f0f-5108332a1146/matchmakingQueues”
                }
            }
        },
        “links”: {
            “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSets/7353266e-8c6f-4cbe-8f0f-5108332a1146”
        }
    },
    “links”: {
        “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRuleSets”
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)