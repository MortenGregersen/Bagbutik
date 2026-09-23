<!--
{
  "availability" : [
    "App Store Connect API: 2.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v2-inAppPurchases-_id_-inAppPurchaseAvailability",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v2-inAppPurchases-{}-inAppPurchaseAvailability"
  },
  "title" : "Read information about the availability of an in-app purchase"
}
-->

# Read information about the availability of an in-app purchase

Get information about the territory availablity for an in-app purchase.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v2/inAppPurchases/6448262365/inAppPurchaseAvailability
```

**Response:**

```json
{
  “data”: {
    “type”: “inAppPurchaseAvailabilities”,
    “id”: “6448262365”,
    “attributes”: {
      “availableInNewTerritories”: true
    },
    “relationships”: {
      “availableTerritories”: {
        “links”: {
          “self”: “https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6448262365/relationships/availableTerritories”,
          “related”: “https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6448262365/availableTerritories”
        }
      }
    },
    “links”: {
      “self”: “https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6448262365”
    }
  },
  “links”: {
    “self”: “https://api.appstoreconnect.apple.com/v2/inAppPurchases/6448262365/inAppPurchaseAvailability”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)