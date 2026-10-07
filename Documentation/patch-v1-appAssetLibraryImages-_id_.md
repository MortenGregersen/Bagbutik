<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v1-appAssetLibraryImages-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v1-appAssetLibraryImages-{}"
  },
  "title" : "Modify an app asset library image"
}
-->

# Modify an app asset library image

Update an app asset library image.

## Discussion

### Example Request and Response

**Request:**

```
PATCH https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61

{
  "data": {
    "type": "appAssetLibraryImages",
    "id": "f4000005-e036-8f0b-8018-d259974bee61",
    "attributes": {
      "uploaded": true
    }
  }
}
```

**Response:**

```json
{
  "data" : {
    "type" : "appAssetLibraryImages",
    "id" : "f4000005-e036-8f0b-8018-d259974bee61",
    "attributes" : {
      "category" : "APP_SCREENSHOTS_AND_PREVIEWS",
      "createdDate" : "2026-08-11T22:44:12Z",
      "lastModifiedDate" : "2026-08-11T22:44:21Z",
      "fileName" : "menu-screen-6-9.png",
      "fileSize" : 1284736,
      "imageAsset" : null,
      "referenceName" : "Menu screen",
      "specId" : null,
      "state" : "UPLOAD_COMPLETE",
      "stateDetails" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)