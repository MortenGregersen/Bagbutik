<!--
{
  "availability" : [
    "App Store Connect API: 2.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-promotedPurchases",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-promotedPurchases"
  },
  "title" : "List all promoted purchases for an app"
}
-->

# List all promoted purchases for an app

Get a list of promoted in-app purchases, including promoted auto-renewable subscriptions, for an app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/1000001234/promotedPurchases
```

**Response:**

```json
{
  "data": [
    {
      "type": "promotedPurchases",
      "id": "bec0022d-99b1-69b6-7524-e051b51f1976",
      "attributes": {
        "visibleForAllUsers": true,
        "enabled": true,
        "state": "APPROVED"
      },
      "relationships": {
        "promotionImages": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/bec0022d-99b1-69b6-7524-e051b51f1976/relationships/promotionImages",
            "related": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/bec0022d-99b1-69b6-7524-e051b51f1976/promotionImages"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/bec0022d-99b1-69b6-7524-e051b51f1976"
      }
    },
    {
      "type": "promotedPurchases",
      "id": "c5eb5306-0c66-eb2f-ee6a-7f4100536144",
      "attributes": {
        "visibleForAllUsers": true,
        "enabled": false,
        "state": "PREPARE_FOR_SUBMISSION"
      },
      "relationships": {
        "promotionImages": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/c5eb5306-0c66-eb2f-ee6a-7f4100536144/relationships/promotionImages",
            "related": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/c5eb5306-0c66-eb2f-ee6a-7f4100536144/promotionImages"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/c5eb5306-0c66-eb2f-ee6a-7f4100536144"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/apps/1000001234/promotedPurchases"
  },
  "meta": {
    "paging": {
      "total": 2,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)