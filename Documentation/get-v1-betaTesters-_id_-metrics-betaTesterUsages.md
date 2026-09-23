<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-betaTesters-_id_-metrics-betaTesterUsages",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-betaTesters-{}-metrics-betaTesterUsages"
  },
  "title" : "Read Beta Tester Usage Metrics"
}
-->

# Read Beta Tester Usage Metrics

Get usage metrics for a specific beta tester.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/betaTesters/1aa1fe09-bb5c-47dd-a067-a6066db1d32d/metrics/betaTesterUsages?period=P90D&filter%5Bapps%5D=6447306070
```

**Response:**

```json
{  "data": [
    {
      "type": "betaTesterUsages",
      "dataPoints": [
        {
          "start": "2023-07-07",
          "end": "2023-10-05",
          "values": {
            "crashCount": 11,
            "sessionCount": 9,
            "feedbackCount": 21
          }
        }
      ],
      "dimensions": {
        "apps": {
          "data": {
            "type": "apps",
            "id": "6447306070"
          },
          "links": {
            "related": "https://api.appstoreconnect.apple.com/v1/apps/6447306070"
          }
        }
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/betaTesters/1aa1fe09-bb5c-47dd-a067-a6066db1d32d/metrics/betaTesterUsages?period=PT2160H&filter%5Bapps%5D=6447306070"
  },
  "meta": {
    "paging": {
      "total": 1,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)