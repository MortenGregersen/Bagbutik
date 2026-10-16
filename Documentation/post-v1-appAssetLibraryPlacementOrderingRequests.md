<!--
{
  "availability" : [
    "App Store Connect API: 4.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-appAssetLibraryPlacementOrderingRequests",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-appAssetLibraryPlacementOrderingRequests"
  },
  "title" : "Create an app asset library placement ordering request"
}
-->

# Create an app asset library placement ordering request

Create an app asset library placement ordering request.

## Discussion

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacementOrderingRequests

{
  "data": {
    "type": "appAssetLibraryPlacementOrderingRequests",
    "attributes": {
      "placementGroup": "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE"
    },
    "relationships": {
      "orderedPlacements": {
        "data": [
          {
            "type": "appAssetLibraryPlacements",
            "id": "1e800005-e036-8f0b-8f37-9c5cc67e23a1"
          },
          {
            "type": "appAssetLibraryPlacements",
            "id": "2e000005-e036-8f0b-8f25-6dbc2baa784a"
          }
        ]
      },
      "appStoreVersionLocalization": {
        "data": {
          "type": "appStoreVersionLocalizations",
          "id": "b3a9b4c2-d2de-43f4-ad8c-71c5ebe301d1"
        }
      }
    }
  }
}
```

**Response:**

```json
{
  "data" : {
    "type" : "appAssetLibraryPlacementOrderingRequests",
    "id" : "24f44809-07db-497e-8ea9-153baedd0771",
    "relationships" : {
      "orderedPlacements" : {
        "meta" : {
          "paging" : {
            "total" : 2,
            "limit" : 10
          }
        },
        "data" : [ {
          "type" : "appAssetLibraryPlacements",
          "id" : "1e800005-e036-8f0b-8f37-9c5cc67e23a1"
        }, {
          "type" : "appAssetLibraryPlacements",
          "id" : "2e000005-e036-8f0b-8f25-6dbc2baa784a"
        } ]
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacementOrderingRequests/24f44809-07db-497e-8ea9-153baedd0771"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacementOrderingRequests"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)