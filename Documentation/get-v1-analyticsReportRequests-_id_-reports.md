<!--
{
  "availability" : [
    "App Store Connect API: 3.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-analyticsReportRequests-_id_-reports",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-analyticsReportRequests-{}-reports"
  },
  "title" : "Read Reports for a Specific Request"
}
-->

# Read Reports for a Specific Request

Get a list of reports generated from a specific analytics report request.

## Discussion

### Examples Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports?limit=5
```

**Response:**

```json
{
  "data": [
    {
      "type": "analyticsReports",
      "id": "r19-d48c69c5-9bcb-4592-abbd-08a9411b0231",
      "attributes": {
        "name": "Streaming Playback Performance",
        "category": "PERFORMANCE"
      },
      "relationships": {
        "instances": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r19-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
            "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r19-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r19-d48c69c5-9bcb-4592-abbd-08a9411b0231"
      }
    },
    {
      "type": "analyticsReports",
      "id": "r20-d48c69c5-9bcb-4592-abbd-08a9411b0231",
      "attributes": {
        "name": "Streaming Downloads Performance",
        "category": "PERFORMANCE"
      },
      "relationships": {
        "instances": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r20-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
            "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r20-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r20-d48c69c5-9bcb-4592-abbd-08a9411b0231"
      }
    },
    {
      "type": "analyticsReports",
      "id": "r142-d48c69c5-9bcb-4592-abbd-08a9411b0231",
      "attributes": {
        "name": "App Crashes Expanded",
        "category": "PERFORMANCE"
      },
      "relationships": {
        "instances": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r142-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
            "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r142-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r142-d48c69c5-9bcb-4592-abbd-08a9411b0231"
      }
    },
    {
      "type": "analyticsReports",
      "id": "r143-d48c69c5-9bcb-4592-abbd-08a9411b0231",
      "attributes": {
        "name": "App Storage Reads and Writes",
        "category": "PERFORMANCE"
      },
      "relationships": {
        "instances": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r143-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
            "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r143-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r143-d48c69c5-9bcb-4592-abbd-08a9411b0231"
      }
    },
    {
      "type": "analyticsReports",
      "id": "r23-d48c69c5-9bcb-4592-abbd-08a9411b0231",
      "attributes": {
        "name": "AirPlay Performance",
        "category": "PERFORMANCE"
      },
      "relationships": {
        "instances": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r23-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
            "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r23-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r23-d48c69c5-9bcb-4592-abbd-08a9411b0231"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports?limit=5",
    "next": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports?cursor=BQ.ALHoGBE&limit=5"
  },
  "meta": {
    "paging": {
      "total": 116,
      "limit": 5
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)