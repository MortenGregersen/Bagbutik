<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/DELETE-v1-gameCenterAchievementLocalizations-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:delete:v1-gameCenterAchievementLocalizations-{}"
  },
  "title" : "Delete an Achievement Localization"
}
-->

# Delete an Achievement Localization

Delete localization metadata that’s associated with an achievement.

## Discussion

### Example Request and Response

**Request:**

```
DELETE https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f -d
{
    “data”: {
        “type”: “gameCenterAchievementLocalizations”,
        “id”: “ca329301-e7ad-4784-97cd-02faade43c2f”,
        “attributes”: {
            “beforeEarnedDescription”: “You can earn this achievement upon steaming milk to the perfect texture.”
        }
    }
}
```

**Response:**

```json
HTTP/1.1 204 No Content
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)