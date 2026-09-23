<!--
{
  "availability" : [
    "App Store Connect API: 3.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-analyticsReportRequests",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-analyticsReportRequests"
  },
  "title" : "Request Reports"
}
-->

# Request Reports

Request analytics reports for your apps.

## Discussion

When making a request with this endpoint, the `accessType` `ONGOING` is most common and provides current data. This report request generates reports daily for each granularity: daily, weekly, and monthly. Use `ONE_TIME_SNAPSHOT` to get historical data.

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/analyticsReportRequests 
{
  "data": {
    "type": "analyticsReportRequests",
    "attributes": {
          "accessType": "ONGOING"
    },
    "relationships": {
      "app": {
        "data": {
          "type": "apps",
          "id": "1476097583"
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
    "type" : "analyticsReportRequests",
    "id" : "d48c69c5-9bcb-4592-abbd-08a9411b0231",
    "attributes" : {
      "accessType" : "ONGOING",
      "stoppedDueToInactivity" : false
    },
    "relationships" : {
      "reports" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/reports",
          "related" : "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)