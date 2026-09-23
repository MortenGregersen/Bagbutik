<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appInfos",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-appInfos"
  },
  "title" : "List all app infos for an app"
}
-->

# List all app infos for an app

Get information about an app that is currently live on App Store, or that goes live with the next version.

## Discussion

Use this endpoint to retrieve the derived app-level information for an app. If the app has both a “Ready for Sale” version and a version you’re preparing for release, it will have two app infos. One represents information about the app currently in the App Store, and the other represents the information that takes effect when you release the next version. Use the `appStoreState` attribute to differentiate them.

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/1462965264/appInfos
```

**Response:**

```json
{
  "data": [
    {
      "type": "appInfos",
      "id": "726ad1bb-3e1e-40eb-a986-d8a9897e4f1d",
      "attributes": {
        "appStoreState": "PREPARE_FOR_SUBMISSION",
        "appStoreAgeRating": "NINE_PLUS",
        "brazilAgeRating": "TEN",
        "kidsAgeBand": null
      },
      "relationships": {
        "app": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/relationships/app",
            "related": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/app"
          }
        },
        "appInfoLocalizations": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/relationships/appInfoLocalizations",
            "related": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/appInfoLocalizations"
          }
        },
        "primaryCategory": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/relationships/primaryCategory",
            "related": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/primaryCategory"
          }
        },
        "primarySubcategoryOne": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/relationships/primarySubcategoryOne",
            "related": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/primarySubcategoryOne"
          }
        },
        "primarySubcategoryTwo": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/relationships/primarySubcategoryTwo",
            "related": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/primarySubcategoryTwo"
          }
        },
        "secondaryCategory": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/relationships/secondaryCategory",
            "related": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/secondaryCategory"
          }
        },
        "secondarySubcategoryOne": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/relationships/secondarySubcategoryOne",
            "related": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/secondarySubcategoryOne"
          }
        },
        "secondarySubcategoryTwo": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/relationships/secondarySubcategoryTwo",
            "related": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d/secondarySubcategoryTwo"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appInfos/726ad1bb-3e1e-40eb-a986-d8a9897e4f1d"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/apps/1462965264/appInfos"
  },
  "meta": {
    "paging": {
      "total": 1,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)