<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appAssetLibraries-_id_-images",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appAssetLibraries-{}-images"
  },
  "title" : "List related images"
}
-->

# List related images

List the image assets in an app’s asset library.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/images?filter[state]=PREPARE_FOR_SUBMISSION&sort=-createdDate&limit=2
```

**Response:**

```json
{
  "data" : [ {
    "type" : "appAssetLibraryImages",
    "id" : "c3000005-e036-8f0b-8038-36fbc8d1c4ae",
    "attributes" : {
      "category" : "APP_SCREENSHOTS_AND_PREVIEWS",
      "createdDate" : "2026-08-11T22:47:02Z",
      "lastModifiedDate" : "2026-08-11T22:47:19Z",
      "fileName" : "order-screen-6-9.png",
      "fileSize" : 1284736,
      "imageAsset" : {
        "templateUrl" : "https://is1.mzstatic.com/image/thumb/AOsFKpK1JfF_vrxSCSbIew/{w}x{h}bb.{f}",
        "width" : 1290,
        "height" : 2796
      },
      "referenceName" : "Order screen",
      "specId" : "f56c777c-99ea-5760-97ae-27c5f8cbb884",
      "state" : "PREPARE_FOR_SUBMISSION",
      "stateDetails" : null
    },
    "relationships" : {
      "placements" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/c3000005-e036-8f0b-8038-36fbc8d1c4ae/relationships/placements",
          "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/c3000005-e036-8f0b-8038-36fbc8d1c4ae/placements"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/c3000005-e036-8f0b-8038-36fbc8d1c4ae"
    }
  }, {
    "type" : "appAssetLibraryImages",
    "id" : "f4000005-e036-8f0b-8018-d259974bee61",
    "attributes" : {
      "category" : "APP_SCREENSHOTS_AND_PREVIEWS",
      "createdDate" : "2026-08-11T22:44:12Z",
      "lastModifiedDate" : "2026-08-11T22:44:31Z",
      "fileName" : "menu-screen-6-9.png",
      "fileSize" : 1284736,
      "imageAsset" : {
        "templateUrl" : "https://is1.mzstatic.com/image/thumb/AOsFKpK1JfF_vrxSCSbIew/{w}x{h}bb.{f}",
        "width" : 1290,
        "height" : 2796
      },
      "referenceName" : "Menu screen",
      "specId" : "f56c777c-99ea-5760-97ae-27c5f8cbb884",
      "state" : "PREPARE_FOR_SUBMISSION",
      "stateDetails" : null
    },
    "relationships" : {
      "placements" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61/relationships/placements",
          "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61/placements"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/images"
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