<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appAssetLibraryVideos-_id_-placements",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appAssetLibraryVideos-{}-placements"
  },
  "title" : "List related placements"
}
-->

# List related placements

List the placements that reuse an app asset library video.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/placements?limit=1
```

**Response:**

```json
{
  "data" : [ {
    "type" : "appAssetLibraryPlacements",
    "id" : "2e000005-e036-8f0b-8f25-6dbc2baa784a",
    "attributes" : {
      "mediaType" : "VIDEO",
      "placementType" : "APP_PREVIEW",
      "placementGroup" : "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE",
      "createdDate" : "2026-08-11T22:45:27Z",
      "lastModifiedDate" : "2026-08-11T22:45:27Z",
      "state" : "PARENT_PREPARE_FOR_SUBMISSION",
      "stateDetails" : null
    },
    "relationships" : {
      "video" : {
        "data" : {
          "type" : "appAssetLibraryVideos",
          "id" : "3b100005-e036-8f0b-8021-77aa41c6b502"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacements/2e000005-e036-8f0b-8f25-6dbc2baa784a"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/placements"
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