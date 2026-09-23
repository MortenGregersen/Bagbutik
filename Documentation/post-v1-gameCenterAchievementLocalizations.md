<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-gameCenterAchievementLocalizations",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-gameCenterAchievementLocalizations"
  },
  "title" : "Create an Achievement Localization"
}
-->

# Create an Achievement Localization

Add Game Center achievement localized information for a new locale.

## Discussion

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations -d {
    “data”: {
        “type”: “gameCenterAchievementLocalizations”,
        “attributes”: {
            “locale”: “en-US”,
            “name”: “Perfectly steamed milk”,
            “afterEarnedDescription”: “You did it! The milk had the perfect texture.”,
            “beforeEarnedDescription”: “You will earn this achievement upon steaming milk to the perfect texture.”
        },
        “relationships”: {
            “gameCenterAchievement”: {
                “data”: {
                    “type”: “gameCenterAchievements”,
                    “id”: “304e0f56-63b2-492f-980e-bce6fafb8502”
                }
            }
        }
    }
}
```

**Response:**

```json
{
  “data” : {
    “type” : “gameCenterAchievementLocalizations”,
    “id” : “ca329301-e7ad-4784-97cd-02faade43c2f”,
    “attributes” : {
      “locale” : “en-US”,
      “name” : “Perfectly steamed milk”,
      “beforeEarnedDescription” : “You will earn this achievement upon steaming milk to the perfect texture.”,
      “afterEarnedDescription” : “You did it! The milk had the perfect texture.”
    },
    “relationships” : {
      “gameCenterAchievement” : {
        “links” : {
          “self” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/relationships/gameCenterAchievement”,
          “related” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/gameCenterAchievement”
        }
      },
      “gameCenterAchievementImage” : {
        “links” : {
          “self” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/relationships/gameCenterAchievementImage”,
          “related” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/gameCenterAchievementImage”
        }
      }
    },
    “links” : {
      “self” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f”
    }
  },
  “links” : {
    “self” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)