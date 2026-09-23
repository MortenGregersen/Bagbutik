<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-builds-_id_-metrics-betaBuildUsages",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-builds-{}-metrics-betaBuildUsages"
  },
  "title" : "Read Usage Metrics for a Beta Build"
}
-->

# Read Usage Metrics for a Beta Build

Get usage metrics for a specific build.

## Discussion

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/builds/ace4f47a-60ae-4ed6-954f-c4e61c7baab0/metrics/betaBuildUsages
```

**Response:**

```json
{
  “data”: [
    {
      “type”: “betaBuildUsages”,
      “dataPoints”: [
        {
          “start”: “2022-10-05”,
          “end”: “2023-10-05”,
          “values”: {
            “installCount”: 2,
            “crashCount”: 0,
            “sessionCount”: 0,
            “inviteCount”: 0,
            “feedbackCount”: 0
          }
        }
      ]
    }
  ],
  “links”: {
    “self”: “https://api.appstoreconnect.apple.com/v1/builds/ace4f47a-60ae-4ed6-954f-c4e61c7baab0/metrics/betaBuildUsages”
  },
  “meta”: {
    “paging”: {
      “total”: 1,
      “limit”: 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)