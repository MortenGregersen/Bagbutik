<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appPriceSchedule",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-appPriceSchedule"
  },
  "title" : "Read Price Schedule Information for an App"
}
-->

# Read Price Schedule Information for an App

Read price schedule details for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPriceSchedule
```

**Response:**

```json
{
  "data" : {
    "type" : "appPriceSchedules",
    "id" : "6447402192",
    "relationships" : {
      "baseTerritory" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/relationships/baseTerritory",
          "related" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/baseTerritory"
        }
      },
      "manualPrices" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/relationships/manualPrices",
          "related" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/manualPrices"
        }
      },
      "automaticPrices" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/relationships/automaticPrices",
          "related" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/automaticPrices"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPriceSchedule"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)