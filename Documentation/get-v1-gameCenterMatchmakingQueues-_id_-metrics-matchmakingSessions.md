<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterMatchmakingQueues-_id_-metrics-matchmakingSessions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterMatchmakingQueues-{}-metrics-matchmakingSessions"
  },
  "title" : "Get Queue Session Information"
}
-->

# Get Queue Session Information

Get session information on a queue.

## Discussion

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/0df9ae63-0328-4060-9afc-53e848e8c386/metrics/matchmakingSessions?granularity=PT15M
```

**Response:**

```json
{
  "data": [
    {
      "type": "gameCenterMatchmakingSessions",
      "dataPoints": [
        {
          "start": "2023-10-10T23:30:00Z",
          "end": "2023-10-10T23:45:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T23:15:00Z",
          "end": "2023-10-10T23:30:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T23:00:00Z",
          "end": "2023-10-10T23:15:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T22:45:00Z",
          "end": "2023-10-10T23:00:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T22:30:00Z",
          "end": "2023-10-10T22:45:00Z",
          "values": {
            "count": 1,
            "p50PlayerCount": 2,
            "averagePlayerCount": 2,
            "p95PlayerCount": 2
          }
        },
        {
          "start": "2023-10-10T22:15:00Z",
          "end": "2023-10-10T22:30:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T22:00:00Z",
          "end": "2023-10-10T22:15:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T21:45:00Z",
          "end": "2023-10-10T22:00:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T21:30:00Z",
          "end": "2023-10-10T21:45:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T21:15:00Z",
          "end": "2023-10-10T21:30:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T21:00:00Z",
          "end": "2023-10-10T21:15:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T20:45:00Z",
          "end": "2023-10-10T21:00:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T20:30:00Z",
          "end": "2023-10-10T20:45:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T20:15:00Z",
          "end": "2023-10-10T20:30:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T20:00:00Z",
          "end": "2023-10-10T20:15:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T19:45:00Z",
          "end": "2023-10-10T20:00:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T19:30:00Z",
          "end": "2023-10-10T19:45:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T19:15:00Z",
          "end": "2023-10-10T19:30:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T19:00:00Z",
          "end": "2023-10-10T19:15:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T18:45:00Z",
          "end": "2023-10-10T19:00:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T18:30:00Z",
          "end": "2023-10-10T18:45:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T18:15:00Z",
          "end": "2023-10-10T18:30:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T18:00:00Z",
          "end": "2023-10-10T18:15:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T17:45:00Z",
          "end": "2023-10-10T18:00:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T17:30:00Z",
          "end": "2023-10-10T17:45:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T17:15:00Z",
          "end": "2023-10-10T17:30:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T17:00:00Z",
          "end": "2023-10-10T17:15:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T16:45:00Z",
          "end": "2023-10-10T17:00:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T16:30:00Z",
          "end": "2023-10-10T16:45:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T16:15:00Z",
          "end": "2023-10-10T16:30:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T16:00:00Z",
          "end": "2023-10-10T16:15:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        },
        {
          "start": "2023-10-10T15:45:00Z",
          "end": "2023-10-10T16:00:00Z",
          "values": {
            "count": 0,
            "p50PlayerCount": 0,
            "averagePlayerCount": 0,
            "p95PlayerCount": 0
          }
        }
      ],
      "granularity": 900
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/0df9ae63-0328-4060-9afc-53e848e8c386/metrics/matchmakingSessions?granularity=PT15M"
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