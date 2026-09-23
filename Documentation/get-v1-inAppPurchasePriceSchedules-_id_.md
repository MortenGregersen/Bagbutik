<!--
{
  "availability" : [
    "App Store Connect API: 2.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-inAppPurchasePriceSchedules-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-inAppPurchasePriceSchedules-{}"
  },
  "title" : "Read In-App Purchase Price Schedule Information"
}
-->

# Read In-App Purchase Price Schedule Information

Get information about a specific scheduled price change for an in-app purchase.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593
```

**Response:**

```json
{
  "data" : {
    "type" : "inAppPurchasePriceSchedules",
    "id" : "6447501593",
    "relationships" : {
      "baseTerritory" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/relationships/baseTerritory",
          "related" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/baseTerritory"
        }
      },
      "manualPrices" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/relationships/manualPrices",
          "related" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/manualPrices"
        }
      },
      "automaticPrices" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/relationships/automaticPrices",
          "related" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/automaticPrices"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)