<!--
{
  "availability" : [
    "App Store Connect API: 3.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-analyticsReportInstances-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-analyticsReportInstances-{}"
  },
  "title" : "Read Report Instance Information"
}
-->

# Read Report Instance Information

Get details for a specific instance of an analytics report.

## Discussion

> Note:
> If you don’t retrieve data for a long time, a report request changes to `stoppedDueToInactivity`. You need to make a new request to resume getting reports.

### Examples Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641
```

**Response:**

```json
{
  "data": {
    "type": "analyticsReportInstances",
    "id": "d4a141c8-7647-4bdf-b9ae-04cab705d641",
    "attributes": {
      "granularity": "DAILY",
      "processingDate": "2024-01-25"
    },
    "relationships": {
      "segments": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641/relationships/segments",
          "related": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641/segments"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)