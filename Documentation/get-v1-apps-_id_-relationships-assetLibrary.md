<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-relationships-assetLibrary",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-relationships-assetLibrary"
  },
  "title" : "Get the asset library ID for an app"
}
-->

# Get the asset library ID for an app

Get the asset library resource ID for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/1234567890/relationships/assetLibrary
```

**Response:**

```json
{
  "data" : {
    "type" : "appAssetLibraries",
    "id" : "1234567890"
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/apps/1234567890/relationships/assetLibrary",
    "related" : "https://api.appstoreconnect.apple.com/v1/apps/1234567890/assetLibrary"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)