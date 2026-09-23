<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-betaGroups-_id_-metrics-betaTesterUsages",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-betaGroups-{}-metrics-betaTesterUsages"
  },
  "title" : "Read Metrics for Beta Testers in a Beta Group"
}
-->

# Read Metrics for Beta Testers in a Beta Group

Get beta tester usage metrics for a beta group.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/betaGroups/db51edb0-a8a4-4be9-8481-09dff260ea6e/metrics/betaTesterUsages?groupBy=betaTesters&filter%5BbetaTesters%5D=1aa1fe09-bb5c-47dd-a067-a6066db1d32
```

**Response:**

```json
{
  “data”: [
    {
      “type”: “appsBetaTesterUsages”,
      “dataPoints”: [
        {
          “start”: “2022-10-05”,
          “end”: “2023-10-05”,
          “values”: {
            “crashCount”: 13,
            “sessionCount”: 48,
            “feedbackCount”: 21
          }
        }
      ],
      “dimensions”: {
        “betaTesters”: {
          “data”: {
            “type”: “betaTesters”,
            “id”: “1aa1fe09-bb5c-47dd-a067-a6066db1d32d”
          },
          “links”: {
            “related”: “https://api.appstoreconnect.apple.com/v1/betaTesters/1aa1fe09-bb5c-47dd-a067-a6066db1d32d”,
            “groupBy”: “https://api.appstoreconnect.apple.com/v1/betaGroups/db51edb0-a8a4-4be9-8481-09dff260ea6e/metrics/betaTesterUsages?groupBy=betaTesters”
          }
        }
      }
    }
  ],
  “links”: {
    “self”: “https://api.appstoreconnect.apple.com/v1/betaTesters/842d4014-3ecc-4f80-8531-19aa800e3a53/metrics/betaTesterUsages?period=PT8760H&filter%5Bapps%5D=6448250830”
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