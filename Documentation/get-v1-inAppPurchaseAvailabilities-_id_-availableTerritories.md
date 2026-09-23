<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-inAppPurchaseAvailabilities-_id_-availableTerritories",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-inAppPurchaseAvailabilities-{}-availableTerritories"
  },
  "title" : "List the Territory Availablity of an In-App Purchase"
}
-->

# List the Territory Availablity of an In-App Purchase

List all the territories where an in-app purchase is available.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/availableTerritories
```

**Response:**

```json
{
  "data" : [ {
    "type" : "territories",
    "id" : "ISL",
    "attributes" : {
      "currency" : "USD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/ISL"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/availableTerritories"
  },
  "meta" : {
    "paging" : {
      "total" : 1,
      "limit" : 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)