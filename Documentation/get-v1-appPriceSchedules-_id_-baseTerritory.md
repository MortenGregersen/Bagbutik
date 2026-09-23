<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appPriceSchedules-_id_-baseTerritory",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appPriceSchedules-{}-baseTerritory"
  },
  "title" : "Read the Base Territory for an App's Price Schedule"
}
-->

# Read the Base Territory for an App's Price Schedule

Read the base territory and currency for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/baseTerritory
```

**Response:**

```json
{
  "data" : {
    "type" : "territories",
    "id" : "CAN",
    "attributes" : {
      "currency" : "CAD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/CAN"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/baseTerritory"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)