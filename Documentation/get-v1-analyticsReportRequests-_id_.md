<!--
{
  "availability" : [
    "App Store Connect API: 3.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-analyticsReportRequests-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-analyticsReportRequests-{}"
  },
  "title" : "Read Report Request Information"
}
-->

# Read Report Request Information

Get details for and the state of a specific analytics report request.

## Discussion

> Note:
> If you don’t retrieve data for a long time, a report request changes to `stoppedDueToInactivity`. You need to make a new request to resume getting reports.

### Examples Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231
```

**Response:**

```json
{
  "data": {
    "type": "analyticsReportRequests",
    "id": "d48c69c5-9bcb-4592-abbd-08a9411b0231",
    "attributes": {
      "accessType": "ONGOING",
      "stoppedDueToInactivity": false
    },
    "relationships": {
      "reports": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/reports",
          "related": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)