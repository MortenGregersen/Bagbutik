<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 - 3.0.0"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-inAppPurchases-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-inAppPurchases-{}"
  },
  "title" : "Read in-app purchase information"
}
-->

# Read in-app purchase information

Get information about an in-app purchase.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/inAppPurchases/6446998023
```

**Response:**

```json
{
  "data": [
    {
      "type": "inAppPurchases",
      "id": "6447027998",
      "attributes": {
        "name": "YNC1",
        "productId": "YNCNC1",
        "inAppPurchaseType": "NON_CONSUMABLE",
        "state": "MISSING_METADATA",
        "reviewNote": null,
        "familySharable": false,
        "contentHosting": false,
        "availableInAllTerritories": true
      },
      "relationships": {
        "inAppPurchaseLocalizations": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/inAppPurchaseLocalizations",
            "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/inAppPurchaseLocalizations"
          }
        },
        "pricePoints": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/pricePoints",
            "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/pricePoints"
          }
        },
        "content": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/content",
            "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/content"
          }
        },
        "appStoreReviewScreenshot": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/appStoreReviewScreenshot",
            "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/appStoreReviewScreenshot"
          }
        },
        "promotedPurchase": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/promotedPurchase",
            "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/promotedPurchase"
          }
        },
        "iapPriceSchedule": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/iapPriceSchedule",
            "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/iapPriceSchedule"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/inAppPurchasesV2"
  },
  "meta": {
    "paging": {
      "total": 1,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)