<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appAssetLibraries-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appAssetLibraries-{}"
  },
  "title" : "Read an app asset library"
}
-->

# Read an app asset library

Get information about an app’s asset library.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890
```

**Response:**

```json
{
  "data" : {
    "type" : "appAssetLibraries",
    "id" : "1234567890",
    "relationships" : {
      "images" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/images",
          "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/images"
        }
      },
      "videos" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/videos",
          "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/videos"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)