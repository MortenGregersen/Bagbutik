<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterDetails-_id_-metrics-ruleBasedMatchmakingRequests",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterDetails-{}-metrics-ruleBasedMatchmakingRequests"
  },
  "title" : "Get Rule-Based Match Requests"
}
-->

# Get Rule-Based Match Requests

Get match requests that use matchmaking rules.

## Discussion

### Example Request and Response

**Request:**

```
GET /v1/gameCenterDetails/8fb73d41-1ca1-1cbf-2538-9df424beb10b/metrics/ruleBasedMatchmakingRequests?granularity=PT15M
```

**Response:**

```json
{
  “data”: [
    {
      “type”: “gameCenterMatchmakingAppRequests”,
      “dataPoints”: [
        {
          “start”: “2023-10-05T04:00:00Z”,
          “end”: “2023-10-05T04:15:00Z”,
          “values”: {
            “averageSecondsInQueue”: 2.9630714285714284,
            “p95SecondsInQueue”: 3.838,
            “count”: 14,
            “p50SecondsInQueue”: 3.36
          }
        },
        {
          “start”: “2023-10-05T03:45:00Z”,
          “end”: “2023-10-05T04:00:00Z”,
          “values”: {
            “averageSecondsInQueue”: 87.95857142857143,
            “p95SecondsInQueue”: 302.343,
            “count”: 14,
            “p50SecondsInQueue”: 3.435
          }
        },
        {
          “start”: “2023-10-05T03:30:00Z”,
          “end”: “2023-10-05T03:45:00Z”,
          “values”: {
            “averageSecondsInQueue”: 3.7325,
            “p95SecondsInQueue”: 3.984,
            “count”: 4,
            “p50SecondsInQueue”: 3.818
          }
        },
        {
          “start”: “2023-10-05T03:15:00Z”,
          “end”: “2023-10-05T03:30:00Z”,
          “values”: {
            “averageSecondsInQueue”: 301.53325,
            “p95SecondsInQueue”: 302.924,
            “count”: 4,
            “p50SecondsInQueue”: 302.62
          }
        },
        {
          “start”: “2023-10-05T03:00:00Z”,
          “end”: “2023-10-05T03:15:00Z”,
          “values”: {
            “averageSecondsInQueue”: 2.883714285714286,
            “p95SecondsInQueue”: 3.53,
            “count”: 14,
            “p50SecondsInQueue”: 3.346
          }
        },
        {
          “start”: “2023-10-05T02:45:00Z”,
          “end”: “2023-10-05T03:00:00Z”,
          “values”: {
            “averageSecondsInQueue”: 87.926,
            “p95SecondsInQueue”: 302.848,
            “count”: 14,
            “p50SecondsInQueue”: 3.197
          }
        },
        {
          “start”: “2023-10-05T02:30:00Z”,
          “end”: “2023-10-05T02:45:00Z”,
          “values”: {
            “averageSecondsInQueue”: 3.42825,
            “p95SecondsInQueue”: 3.66,
            “count”: 4,
            “p50SecondsInQueue”: 3.503
          }
        },
        {
          “start”: “2023-10-05T02:15:00Z”,
          “end”: “2023-10-05T02:30:00Z”,
          “values”: {
            “averageSecondsInQueue”: 300.98025,
            “p95SecondsInQueue”: 301.383,
            “count”: 4,
            “p50SecondsInQueue”: 301.108
          }
        },
        {
          “start”: “2023-10-05T02:00:00Z”,
          “end”: “2023-10-05T02:15:00Z”,
          “values”: {
            “averageSecondsInQueue”: 2.928,
            “p95SecondsInQueue”: 3.777,
            “count”: 14,
            “p50SecondsInQueue”: 3.29
          }
        },
        {
          “start”: “2023-10-05T01:45:00Z”,
          “end”: “2023-10-05T02:00:00Z”,
          “values”: {
            “averageSecondsInQueue”: 87.93171428571429,
            “p95SecondsInQueue”: 302.445,
            “count”: 14,
            “p50SecondsInQueue”: 3.242
          }
        },
        {
          “start”: “2023-10-05T01:30:00Z”,
          “end”: “2023-10-05T01:45:00Z”,
          “values”: {
            “averageSecondsInQueue”: 3.1195,
            “p95SecondsInQueue”: 3.34,
            “count”: 4,
            “p50SecondsInQueue”: 3.196
          }
        },
        {
          “start”: “2023-10-05T01:15:00Z”,
          “end”: “2023-10-05T01:30:00Z”,
          “values”: {
            “averageSecondsInQueue”: 301.0555,
            “p95SecondsInQueue”: 302.572,
            “count”: 4,
            “p50SecondsInQueue”: 301.148
          }
        },
        {
          “start”: “2023-10-05T01:00:00Z”,
          “end”: “2023-10-05T01:15:00Z”,
          “values”: {
            “averageSecondsInQueue”: 3.0154285714285716,
            “p95SecondsInQueue”: 3.678,
            “count”: 14,
            “p50SecondsInQueue”: 3.484
          }
        },
        {
          “start”: “2023-10-05T00:45:00Z”,
          “end”: “2023-10-05T01:00:00Z”,
          “values”: {
            “averageSecondsInQueue”: 88.19257142857144,
            “p95SecondsInQueue”: 302.78,
            “count”: 14,
            “p50SecondsInQueue”: 3.413
          }
        },
        {
          “start”: “2023-10-05T00:30:00Z”,
          “end”: “2023-10-05T00:45:00Z”,
          “values”: {
            “averageSecondsInQueue”: 3.109,
            “p95SecondsInQueue”: 3.387,
            “count”: 4,
            “p50SecondsInQueue”: 3.182
          }
        },
        {
          “start”: “2023-10-05T00:15:00Z”,
          “end”: “2023-10-05T00:30:00Z”,
          “values”: {
            “averageSecondsInQueue”: 301.06625,
            “p95SecondsInQueue”: 302.979,
            “count”: 4,
            “p50SecondsInQueue”: 300.68
          }
        },
        {
          “start”: “2023-10-05T00:00:00Z”,
          “end”: “2023-10-05T00:15:00Z”,
          “values”: {
            “averageSecondsInQueue”: 2.8656428571428574,
            “p95SecondsInQueue”: 3.663,
            “count”: 14,
            “p50SecondsInQueue”: 3.237
          }
        },
        {
          “start”: “2023-10-04T23:45:00Z”,
          “end”: “2023-10-05T00:00:00Z”,
          “values”: {
            “averageSecondsInQueue”: 88.13835714285715,
            “p95SecondsInQueue”: 303.037,
            “count”: 14,
            “p50SecondsInQueue”: 3.409
          }
        },
        {
          “start”: “2023-10-04T23:30:00Z”,
          “end”: “2023-10-04T23:45:00Z”,
          “values”: {
            “averageSecondsInQueue”: 3.0285,
            “p95SecondsInQueue”: 3.312,
            “count”: 4,
            “p50SecondsInQueue”: 3.152
          }
        },
        {
          “start”: “2023-10-04T23:15:00Z”,
          “end”: “2023-10-04T23:30:00Z”,
          “values”: {
            “averageSecondsInQueue”: 0,
            “p95SecondsInQueue”: 0,
            “count”: 0,
            “p50SecondsInQueue”: 0
          }
        },
        {
          “start”: “2023-10-04T23:00:00Z”,
          “end”: “2023-10-04T23:15:00Z”,
          “values”: {
            “averageSecondsInQueue”: 0,
            “p95SecondsInQueue”: 0,
            “count”: 0,
            “p50SecondsInQueue”: 0
          }
        },
        {
          “start”: “2023-10-04T22:45:00Z”,
          “end”: “2023-10-04T23:00:00Z”,
          “values”: {
            “averageSecondsInQueue”: 0,
            “p95SecondsInQueue”: 0,
            “count”: 0,
            “p50SecondsInQueue”: 0
          }
        },
        {
          “start”: “2023-10-04T22:30:00Z”,
          “end”: “2023-10-04T22:45:00Z”,
          “values”: {
            “averageSecondsInQueue”: 0,
            “p95SecondsInQueue”: 0,
            “count”: 0,
            “p50SecondsInQueue”: 0
          }
        },
        {
          “start”: “2023-10-04T22:15:00Z”,
          “end”: “2023-10-04T22:30:00Z”,
          “values”: {
            “averageSecondsInQueue”: 0,
            “p95SecondsInQueue”: 0,
            “count”: 0,
            “p50SecondsInQueue”: 0
          }
        },
        {
          “start”: “2023-10-04T22:00:00Z”,
          “end”: “2023-10-04T22:15:00Z”,
          “values”: {
            “averageSecondsInQueue”: 0,
            “p95SecondsInQueue”: 0,
            “count”: 0,
            “p50SecondsInQueue”: 0
          }
        },
        {
          “start”: “2023-10-04T21:45:00Z”,
          “end”: “2023-10-04T22:00:00Z”,
          “values”: {
            “averageSecondsInQueue”: 0,
            “p95SecondsInQueue”: 0,
            “count”: 0,
            “p50SecondsInQueue”: 0
          }
        },
        {
          “start”: “2023-10-04T21:30:00Z”,
          “end”: “2023-10-04T21:45:00Z”,
          “values”: {
            “averageSecondsInQueue”: 0,
            “p95SecondsInQueue”: 0,
            “count”: 0,
            “p50SecondsInQueue”: 0
          }
        },
        {
          “start”: “2023-10-04T21:15:00Z”,
          “end”: “2023-10-04T21:30:00Z”,
          “values”: {
            “averageSecondsInQueue”: 301.37775,
            “p95SecondsInQueue”: 302.627,
            “count”: 4,
            “p50SecondsInQueue”: 302.513
          }
        },
        {
          “start”: “2023-10-04T21:00:00Z”,
          “end”: “2023-10-04T21:15:00Z”,
          “values”: {
            “averageSecondsInQueue”: 2.8602857142857143,
            “p95SecondsInQueue”: 3.528,
            “count”: 14,
            “p50SecondsInQueue”: 3.318
          }
        },
        {
          “start”: “2023-10-04T20:45:00Z”,
          “end”: “2023-10-04T21:00:00Z”,
          “values”: {
            “averageSecondsInQueue”: 87.86357142857143,
            “p95SecondsInQueue”: 302.205,
            “count”: 14,
            “p50SecondsInQueue”: 3.173
          }
        },
        {
          “start”: “2023-10-04T20:30:00Z”,
          “end”: “2023-10-04T20:45:00Z”,
          “values”: {
            “averageSecondsInQueue”: 3.11125,
            “p95SecondsInQueue”: 3.359,
            “count”: 4,
            “p50SecondsInQueue”: 3.186
          }
        },
        {
          “start”: “2023-10-04T20:15:00Z”,
          “end”: “2023-10-04T20:30:00Z”,
          “values”: {
            “averageSecondsInQueue”: 0,
            “p95SecondsInQueue”: 0,
            “count”: 0,
            “p50SecondsInQueue”: 0
          }
        }
      ],
      “dimensions”: {
        “result”: {
          “links”: {
            “groupBy”: “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/8fb73d41-1ca1-1cbf-2538-9df424beb10b/metrics/ruleBasedMatchmakingRequests?groupBy=result”
          }
        }
      },
      “granularity”: 900
    }
  ],
  “links”: {
    “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/8fb73d41-1ca1-1cbf-2538-9df424beb10b/metrics/ruleBasedMatchmakingRequests?granularity=PT15M”
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