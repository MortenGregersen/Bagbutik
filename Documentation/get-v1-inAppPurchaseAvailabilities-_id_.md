<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-inAppPurchaseAvailabilities-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-inAppPurchaseAvailabilities-{}"
  },
  "title" : "Read information about the availablity of an in-app purchase"
}
-->

# Read information about the availablity of an in-app purchase

Get information about the territory availablity for an in-app purchase.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593
```

**Response:**

```json
  "data" : {
    "type" : "inAppPurchaseAvailabilities",
    "id" : "6447501593",
    "attributes" : {
      "availableInNewTerritories" : false
    },
    "relationships" : {
      "availableTerritories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/relationships/availableTerritories",
          "related" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/availableTerritories"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)