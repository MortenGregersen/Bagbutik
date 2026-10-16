<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appAssetLibraries-_id_-relationships-videos",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appAssetLibraries-{}-relationships-videos"
  },
  "title" : "List the video IDs for an app asset library"
}
-->

# List the video IDs for an app asset library

Get a list of video asset resource IDs for a specific asset library.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/videos?limit=1
```

**Response:**

```json
{
  "data" : [ {
    "type" : "appAssetLibraryVideos",
    "id" : "3b100005-e036-8f0b-8021-77aa41c6b502"
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/videos",
    "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/videos"
  },
  "meta" : {
    "paging" : {
      "total" : 1,
      "limit" : 1
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)