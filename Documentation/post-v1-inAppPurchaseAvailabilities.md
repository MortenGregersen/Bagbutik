<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-inAppPurchaseAvailabilities",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-inAppPurchaseAvailabilities"
  },
  "title" : "Modify the Territory Availablity of an In-App Purchase"
}
-->

# Modify the Territory Availablity of an In-App Purchase

Update the territory availablity of a specific In-App Purchase.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities -d
{
  "data": {
    "type": "inAppPurchaseAvailabilities",
    "attributes": {
      "availableInNewTerritories": true
    },
    "relationships": {
      "availableTerritories": {
        "data": [
          {
            "type": "territories",
            "id": "USA"
          },
          {
            "type": "territories",
            "id": "CAN"
          },
          {
            "type": "territories",
            "id": "ISL"
          }
        ]
      },
      "inAppPurchase": {
        "data": {
          "id": "6447501593",
          "type": "inAppPurchases"
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
    "type" : "inAppPurchaseAvailabilities",
    "id" : "6447501593",
    "attributes" : {
      "availableInNewTerritories" : true
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
    "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)