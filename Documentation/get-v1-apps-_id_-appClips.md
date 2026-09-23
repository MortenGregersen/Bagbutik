<!--
{
  "availability" : [
    "App Store Connect API: 1.6.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appClips",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-appClips"
  },
  "title" : "List all app clips for an app"
}
-->

# List all app clips for an app

List your app’s associated App Clips.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.comv1/apps/{id}/appClips
```

**Response:**

```json
{
  "data": [
    {
      "type": "appClips",
      "id": "37453eec-75b3-4578-aba4-ah345936650",
      "attributes": {
        "bundleId": "com.domain.app.AppClip"
      },
      "relationships": {
        "appClipDefaultExperiences": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appClips/37453eec-75b3-4578-aba4-ah345936650/relationships/appClipDefaultExperiences",
            "related": "https://api.appstoreconnect.apple.com/v1/appClips/37453eec-75b3-4578-aba4-ah345936650/appClipDefaultExperiences"
          }
        },
        "appClipAdvancedExperiences": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appClips/37453eec-75b3-4578-aba4-ah345936650/relationships/appClipAdvancedExperiences",
            "related": "https://api.appstoreconnect.apple.com/v1/appClips/37453eec-75b3-4578-aba4-ah345936650/appClipAdvancedExperiences"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appClips/37453eec-75b3-4578-aba4-ah345936650"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/apps/1000001234/appClips"
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