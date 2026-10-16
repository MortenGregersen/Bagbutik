<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v1-appAssetLibraryVideos-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v1-appAssetLibraryVideos-{}"
  },
  "title" : "Modify an app asset library video"
}
-->

# Modify an app asset library video

Update an app asset library video.

## Discussion

### Example Request and Response

**Request:**

```
PATCH https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502

{
  "data": {
    "type": "appAssetLibraryVideos",
    "id": "3b100005-e036-8f0b-8021-77aa41c6b502",
    "attributes": {
      "previewFrameTimeCode": "00:00:05:00"
    }
  }
}
```

**Response:**

```json
{
  "data" : {
    "type" : "appAssetLibraryVideos",
    "id" : "3b100005-e036-8f0b-8021-77aa41c6b502",
    "attributes" : {
      "category" : "APP_SCREENSHOTS_AND_PREVIEWS",
      "createdDate" : "2026-08-11T22:51:04Z",
      "lastModifiedDate" : "2026-08-11T22:53:22Z",
      "fileName" : "app-preview-6-9.mp4",
      "fileSize" : 31457280,
      "previewFrameImage" : {
        "image" : {
          "templateUrl" : "https://is1.mzstatic.com/image/thumb/AOsFKpK1JfF_vrxSCSbIew/{w}x{h}bb.{f}",
          "width" : 886,
          "height" : 1920
        },
        "state" : "PROCESSING"
      },
      "previewFrameTimeCode" : "00:00:05:00",
      "referenceName" : "Fall campaign preview",
      "specId" : "1861fdcb-eb99-59e6-8c6c-5a07479d9a84",
      "state" : "PREPARE_FOR_SUBMISSION",
      "stateDetails" : null,
      "videoAsset" : "https://video-ssl.itunes.apple.com/itunes-assets/Video/v4/preview.m3u8"
    },
    "relationships" : {
      "placements" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/relationships/placements",
          "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/placements"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)