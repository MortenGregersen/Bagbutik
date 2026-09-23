<!--
{
  "availability" : [
    "App Store Connect API: 3.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-analyticsReports-_id_-instances",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-analyticsReports-{}-instances"
  },
  "title" : "Read a List of Instances of a Report"
}
-->

# Read a List of Instances of a Report

Read list of all the granularity options for a specific type of analytics report.

## Discussion

### Examples Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances?limit=3&filter%5Bgranularity%5D=DAILY
```

**Response:**

```json
{
  "data": [
    {
      "type": "analyticsReportInstances",
      "id": "5c43f2fa-aae7-4290-8664-d6551784c508",
      "attributes": {
        "granularity": "DAILY",
        "processingDate": "2024-01-23"
      },
      "relationships": {
        "segments": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/5c43f2fa-aae7-4290-8664-d6551784c508/relationships/segments",
            "related": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/5c43f2fa-aae7-4290-8664-d6551784c508/segments"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/5c43f2fa-aae7-4290-8664-d6551784c508"
      }
    },
    {
      "type": "analyticsReportInstances",
      "id": "42b3c667-3d79-47d0-8ee9-775f685a777c",
      "attributes": {
        "granularity": "DAILY",
        "processingDate": "2024-01-24"
      },
      "relationships": {
        "segments": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/42b3c667-3d79-47d0-8ee9-775f685a777c/relationships/segments",
            "related": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/42b3c667-3d79-47d0-8ee9-775f685a777c/segments"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/42b3c667-3d79-47d0-8ee9-775f685a777c"
      }
    },
    {
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
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances?limit=3&filter%5Bgranularity%5D=DAILY",
    "next": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances?cursor=Aw.VGkW1w&limit=3&filter%5Bgranularity%5D=DAILY"
  },
  "meta": {
    "paging": {
      "total": 6,
      "limit": 3
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)