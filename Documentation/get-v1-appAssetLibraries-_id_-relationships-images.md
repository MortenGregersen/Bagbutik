<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appAssetLibraries-_id_-relationships-images",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appAssetLibraries-{}-relationships-images"
  },
  "title" : "List the image IDs for an app asset library"
}
-->

# List the image IDs for an app asset library

Get a list of image asset resource IDs for a specific asset library.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/images?limit=2
```

**Response:**

```json
{
  "data" : [ {
    "type" : "appAssetLibraryImages",
    "id" : "f4000005-e036-8f0b-8018-d259974bee61"
  }, {
    "type" : "appAssetLibraryImages",
    "id" : "c3000005-e036-8f0b-8038-36fbc8d1c4ae"
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/images",
    "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/images"
  },
  "meta" : {
    "paging" : {
      "total" : 2,
      "limit" : 2
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)