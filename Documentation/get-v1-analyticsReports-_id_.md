<!--
{
  "availability" : [
    "App Store Connect API: 3.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-analyticsReports-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-analyticsReports-{}"
  },
  "title" : "Read Report Information"
}
-->

# Read Report Information

Get details for a specific analytics report.

## Discussion

### Examples Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231
```

**Response:**

```json
{
  "data": {
    "type": "analyticsReports",
    "id": "r2-d48c69c5-9bcb-4592-abbd-08a9411b0231",
    "attributes": {
      "name": "App Crashes",
      "category": "APP_USAGE"
    },
    "relationships": {
      "instances": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
          "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)