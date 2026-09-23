<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-gameCenterMatchmakingQueues",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-gameCenterMatchmakingQueues"
  },
  "title" : "Create a Queue"
}
-->

# Create a Queue

Create a queue and add it to a rule set.

## Discussion

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues
{
    “data”: {
        “type”: “gameCenterMatchmakingQueues”,
        “attributes”: {
            “referenceName”: “com.example.mygame.GameSettingsQueue”
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
        “type”: “gameCenterMatchmakingQueues”,
        “id”: “aa1c1e6b-f8a9-4bad-b969-860dfd1485c5”,
        “attributes”: {
            “referenceName”: “com.example.mygame.GameSettingsQueue”
        },
        “links”: {
            “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/aa1c1e6b-f8a9-4bad-b969-860dfd1485c5”
        }
    },
    “links”: {
        “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues”
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)