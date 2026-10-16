<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appAssetLibraryRefData-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appAssetLibraryRefData-{}"
  },
  "title" : "Read an app asset library ref data"
}
-->

# Read an app asset library ref data

Get information about an app asset library reference data resource.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appAssetLibraryRefData/1?fields[appAssetLibraryRefData]=imageSpecs
```

**Response:**

```json
{
  "data" : {
    "type" : "appAssetLibraryRefData",
    "id" : "1",
    "attributes" : {
      "features" : [ {
        "featureId" : "APP_STORE_VERSIONS",
        "placementPolicies" : [ {
          "placementType" : "APP_SCREENSHOT",
          "groupLimits" : [ {
            "groupIds" : [ "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE", "MAC_PROFILE" ],
            "maxCount" : 10
          } ]
        } ]
      } ],
      "placementProfileGroups" : [ {
        "placementProfileGroupId" : "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE",
        "platform" : "IPHONE_APP_STORE",
        "displayClassId" : "IPHONE_DYNAMIC_ISLAND_LARGE_DISPLAY"
      } ],
      "imageSpecs" : [ {
        "specId" : "f56c777c-99ea-5760-97ae-27c5f8cbb884",
        "shortName" : "i1290x2796a0",
        "dimensions" : {
          "minWidth" : 1290,
          "maxWidth" : 1290,
          "minHeight" : 2796,
          "maxHeight" : 2796
        },
        "aspectRatio" : "6:13",
        "compatiblePlacementTypes" : [ "APP_SCREENSHOT", "IMESSAGE_APP_SCREENSHOT" ],
        "alphaAllowed" : false,
        "fileExtensions" : [ ".jpg", ".jpeg", ".png" ],
        "maxFileSize" : 524288000,
        "mimeTypes" : [ "image/jpeg", "image/png" ],
        "universalAsset" : false
      } ],
      "videoSpecs" : [ {
        "specId" : "1861fdcb-eb99-59e6-8c6c-5a07479d9a84",
        "shortName" : "v886x1920f23~30t15~30u1",
        "dimensions" : {
          "minWidth" : 886,
          "maxWidth" : 886,
          "minHeight" : 1920,
          "maxHeight" : 1920
        },
        "aspectRatio" : "6:13",
        "compatiblePlacementTypes" : [ "APP_PREVIEW" ],
        "frameRates" : [ {
          "minFps" : 23,
          "maxFps" : 30
        } ],
        "duration" : {
          "min" : "PT15S",
          "max" : "PT30S"
        },
        "audioRequired" : true,
        "fileExtensions" : [ ".mp4", ".m4v", ".mov" ],
        "maxFileSize" : 524288000,
        "mimeTypes" : [ "video/quicktime", "video/mp4", "video/x-m4v" ],
        "universalAsset" : false
      } ],
      "placementTypes" : [ {
        "placementTypeId" : "APP_SCREENSHOT",
        "acceptsAssetCategories" : [ "APP_SCREENSHOTS_AND_PREVIEWS" ],
        "specMappings" : [ {
          "placementGroupId" : "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE",
          "specs" : [ "f56c777c-99ea-5760-97ae-27c5f8cbb884" ]
        } ]
      } ],
      "displayClasses" : [ {
        "displayClassId" : "IPHONE_DYNAMIC_ISLAND_LARGE_DISPLAY",
        "deviceFamily" : "IPHONE",
        "screenDimensions" : [ "6.9" ]
      } ]
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryRefData/1"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryRefData/1"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)