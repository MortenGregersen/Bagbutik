<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-gameCenterMatchmakingRules",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-gameCenterMatchmakingRules"
  },
  "title" : "Create a Rule"
}
-->

# Create a Rule

Add a matchmaking rule to a rule set.

## Discussion

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules
{
    “data”: {
        “type”: “gameCenterMatchmakingRules”,
        “attributes”: {
            “type”: “COMPATIBLE”,
            “description”: “Check whether the players use the same game settings.”,
            “referenceName”: “SameTheme”,
            “expression”: “requests[0].properties.theme == requests[1].properties.theme”
        },
        “relationships”: {
            “ruleSet”: {
                “data”: {
                    “type”: “gameCenterMatchmakingRuleSets”,
                    “id”: “7353266e-8c6f-4cbe-8f0f-5108332a1146”
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
        “type”: “gameCenterMatchmakingRules”,
        “id”: “2fd4bb73-3cca-46ca-aced-395c54ab11bc”,
        “attributes”: {
            “referenceName”: “SameTheme”,
            “description”: “Check whether the players use the same game settings.”,
            “type”: “COMPATIBLE”,
            “expression”: “requests[0].properties.theme == requests[1].properties.theme”,
            “weight”: null
        },
        “links”: {
            “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/2fd4bb73-3cca-46ca-aced-395c54ab11bc”
        }
    },
    “links”: {
        “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules”
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)