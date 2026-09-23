<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterMatchmakingQueues-_id_-metrics-matchmakingRequests",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterMatchmakingQueues-{}-metrics-matchmakingRequests"
  },
  "title" : "Get Match Request Time in Queue"
}
-->

# Get Match Request Time in Queue

Get the match requests that a specific queue processes.

## Discussion

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingRequests?granularity=PT15M&groupBy=result
```

**Response:**

```json
{
  "data": [
    {
      "type": "gameCenterMatchmakingQueueRequests",
      "dataPoints": [
        {
          "start": "2023-10-07T02:15:00Z",
          "end": "2023-10-07T02:30:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T02:00:00Z",
          "end": "2023-10-07T02:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T01:45:00Z",
          "end": "2023-10-07T02:00:00Z",
          "values": {
            "averageSecondsInQueue": 0.165,
            "p95SecondsInQueue": 0.165,
            "count": 1,
            "p50SecondsInQueue": 0.165
          }
        },
        {
          "start": "2023-10-07T01:30:00Z",
          "end": "2023-10-07T01:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T01:15:00Z",
          "end": "2023-10-07T01:30:00Z",
          "values": {
            "averageSecondsInQueue": 0.087,
            "p95SecondsInQueue": 0.087,
            "count": 1,
            "p50SecondsInQueue": 0.087
          }
        },
        {
          "start": "2023-10-07T01:00:00Z",
          "end": "2023-10-07T01:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T00:45:00Z",
          "end": "2023-10-07T01:00:00Z",
          "values": {
            "averageSecondsInQueue": 0.156,
            "p95SecondsInQueue": 0.156,
            "count": 1,
            "p50SecondsInQueue": 0.156
          }
        },
        {
          "start": "2023-10-07T00:30:00Z",
          "end": "2023-10-07T00:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T00:15:00Z",
          "end": "2023-10-07T00:30:00Z",
          "values": {
            "averageSecondsInQueue": 0.067,
            "p95SecondsInQueue": 0.067,
            "count": 1,
            "p50SecondsInQueue": 0.067
          }
        },
        {
          "start": "2023-10-07T00:00:00Z",
          "end": "2023-10-07T00:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T23:45:00Z",
          "end": "2023-10-07T00:00:00Z",
          "values": {
            "averageSecondsInQueue": 0.206,
            "p95SecondsInQueue": 0.206,
            "count": 1,
            "p50SecondsInQueue": 0.206
          }
        },
        {
          "start": "2023-10-06T23:30:00Z",
          "end": "2023-10-06T23:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T23:15:00Z",
          "end": "2023-10-06T23:30:00Z",
          "values": {
            "averageSecondsInQueue": 0.101,
            "p95SecondsInQueue": 0.101,
            "count": 1,
            "p50SecondsInQueue": 0.101
          }
        },
        {
          "start": "2023-10-06T23:00:00Z",
          "end": "2023-10-06T23:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T22:45:00Z",
          "end": "2023-10-06T23:00:00Z",
          "values": {
            "averageSecondsInQueue": 0.162,
            "p95SecondsInQueue": 0.162,
            "count": 1,
            "p50SecondsInQueue": 0.162
          }
        },
        {
          "start": "2023-10-06T22:30:00Z",
          "end": "2023-10-06T22:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T22:15:00Z",
          "end": "2023-10-06T22:30:00Z",
          "values": {
            "averageSecondsInQueue": 0.092,
            "p95SecondsInQueue": 0.092,
            "count": 1,
            "p50SecondsInQueue": 0.092
          }
        },
        {
          "start": "2023-10-06T22:00:00Z",
          "end": "2023-10-06T22:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T21:45:00Z",
          "end": "2023-10-06T22:00:00Z",
          "values": {
            "averageSecondsInQueue": 0.165,
            "p95SecondsInQueue": 0.165,
            "count": 1,
            "p50SecondsInQueue": 0.165
          }
        },
        {
          "start": "2023-10-06T21:30:00Z",
          "end": "2023-10-06T21:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T21:15:00Z",
          "end": "2023-10-06T21:30:00Z",
          "values": {
            "averageSecondsInQueue": 0.096,
            "p95SecondsInQueue": 0.096,
            "count": 1,
            "p50SecondsInQueue": 0.096
          }
        },
        {
          "start": "2023-10-06T21:00:00Z",
          "end": "2023-10-06T21:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T20:45:00Z",
          "end": "2023-10-06T21:00:00Z",
          "values": {
            "averageSecondsInQueue": 0.164,
            "p95SecondsInQueue": 0.164,
            "count": 1,
            "p50SecondsInQueue": 0.164
          }
        },
        {
          "start": "2023-10-06T20:30:00Z",
          "end": "2023-10-06T20:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T20:15:00Z",
          "end": "2023-10-06T20:30:00Z",
          "values": {
            "averageSecondsInQueue": 0.093,
            "p95SecondsInQueue": 0.093,
            "count": 1,
            "p50SecondsInQueue": 0.093
          }
        },
        {
          "start": "2023-10-06T20:00:00Z",
          "end": "2023-10-06T20:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T19:45:00Z",
          "end": "2023-10-06T20:00:00Z",
          "values": {
            "averageSecondsInQueue": 0.161,
            "p95SecondsInQueue": 0.161,
            "count": 1,
            "p50SecondsInQueue": 0.161
          }
        },
        {
          "start": "2023-10-06T19:30:00Z",
          "end": "2023-10-06T19:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T19:15:00Z",
          "end": "2023-10-06T19:30:00Z",
          "values": {
            "averageSecondsInQueue": 0.091,
            "p95SecondsInQueue": 0.091,
            "count": 1,
            "p50SecondsInQueue": 0.091
          }
        },
        {
          "start": "2023-10-06T19:00:00Z",
          "end": "2023-10-06T19:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T18:45:00Z",
          "end": "2023-10-06T19:00:00Z",
          "values": {
            "averageSecondsInQueue": 0.156,
            "p95SecondsInQueue": 0.156,
            "count": 1,
            "p50SecondsInQueue": 0.156
          }
        },
        {
          "start": "2023-10-06T18:30:00Z",
          "end": "2023-10-06T18:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        }
      ],
      "dimensions": {
        "result": {
          "data": "CANCELED",
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingRequests?groupBy=result"
          }
        },
        "gameCenterDetail": {
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingRequests?groupBy=gameCenterDetail"
          }
        }
      },
      "granularity": 900
    },
    {
      "type": "gameCenterMatchmakingQueueRequests",
      "dataPoints": [
        {
          "start": "2023-10-07T02:15:00Z",
          "end": "2023-10-07T02:30:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T02:00:00Z",
          "end": "2023-10-07T02:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T01:45:00Z",
          "end": "2023-10-07T02:00:00Z",
          "values": {
            "averageSecondsInQueue": 301.329,
            "p95SecondsInQueue": 302.346,
            "count": 2,
            "p50SecondsInQueue": 302.346
          }
        },
        {
          "start": "2023-10-07T01:30:00Z",
          "end": "2023-10-07T01:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T01:15:00Z",
          "end": "2023-10-07T01:30:00Z",
          "values": {
            "averageSecondsInQueue": 302.5485,
            "p95SecondsInQueue": 302.939,
            "count": 2,
            "p50SecondsInQueue": 302.939
          }
        },
        {
          "start": "2023-10-07T01:00:00Z",
          "end": "2023-10-07T01:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T00:45:00Z",
          "end": "2023-10-07T01:00:00Z",
          "values": {
            "averageSecondsInQueue": 301.0985,
            "p95SecondsInQueue": 302.077,
            "count": 2,
            "p50SecondsInQueue": 302.077
          }
        },
        {
          "start": "2023-10-07T00:30:00Z",
          "end": "2023-10-07T00:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T00:15:00Z",
          "end": "2023-10-07T00:30:00Z",
          "values": {
            "averageSecondsInQueue": 300.4765,
            "p95SecondsInQueue": 300.594,
            "count": 2,
            "p50SecondsInQueue": 300.594
          }
        },
        {
          "start": "2023-10-07T00:00:00Z",
          "end": "2023-10-07T00:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T23:45:00Z",
          "end": "2023-10-07T00:00:00Z",
          "values": {
            "averageSecondsInQueue": 301.6695,
            "p95SecondsInQueue": 302.619,
            "count": 2,
            "p50SecondsInQueue": 302.619
          }
        },
        {
          "start": "2023-10-06T23:30:00Z",
          "end": "2023-10-06T23:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T23:15:00Z",
          "end": "2023-10-06T23:30:00Z",
          "values": {
            "averageSecondsInQueue": 301.864,
            "p95SecondsInQueue": 303.081,
            "count": 2,
            "p50SecondsInQueue": 303.081
          }
        },
        {
          "start": "2023-10-06T23:00:00Z",
          "end": "2023-10-06T23:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T22:45:00Z",
          "end": "2023-10-06T23:00:00Z",
          "values": {
            "averageSecondsInQueue": 301.5675,
            "p95SecondsInQueue": 302.456,
            "count": 2,
            "p50SecondsInQueue": 302.456
          }
        },
        {
          "start": "2023-10-06T22:30:00Z",
          "end": "2023-10-06T22:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T22:15:00Z",
          "end": "2023-10-06T22:30:00Z",
          "values": {
            "averageSecondsInQueue": 301.483,
            "p95SecondsInQueue": 302.768,
            "count": 2,
            "p50SecondsInQueue": 302.768
          }
        },
        {
          "start": "2023-10-06T22:00:00Z",
          "end": "2023-10-06T22:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T21:45:00Z",
          "end": "2023-10-06T22:00:00Z",
          "values": {
            "averageSecondsInQueue": 301.4775,
            "p95SecondsInQueue": 302.304,
            "count": 2,
            "p50SecondsInQueue": 302.304
          }
        },
        {
          "start": "2023-10-06T21:30:00Z",
          "end": "2023-10-06T21:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T21:15:00Z",
          "end": "2023-10-06T21:30:00Z",
          "values": {
            "averageSecondsInQueue": 300.5465,
            "p95SecondsInQueue": 300.993,
            "count": 2,
            "p50SecondsInQueue": 300.993
          }
        },
        {
          "start": "2023-10-06T21:00:00Z",
          "end": "2023-10-06T21:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T20:45:00Z",
          "end": "2023-10-06T21:00:00Z",
          "values": {
            "averageSecondsInQueue": 302.0665,
            "p95SecondsInQueue": 303.031,
            "count": 2,
            "p50SecondsInQueue": 303.031
          }
        },
        {
          "start": "2023-10-06T20:30:00Z",
          "end": "2023-10-06T20:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T20:15:00Z",
          "end": "2023-10-06T20:30:00Z",
          "values": {
            "averageSecondsInQueue": 300.3835,
            "p95SecondsInQueue": 300.738,
            "count": 2,
            "p50SecondsInQueue": 300.738
          }
        },
        {
          "start": "2023-10-06T20:00:00Z",
          "end": "2023-10-06T20:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T19:45:00Z",
          "end": "2023-10-06T20:00:00Z",
          "values": {
            "averageSecondsInQueue": 302.545,
            "p95SecondsInQueue": 303.154,
            "count": 2,
            "p50SecondsInQueue": 303.154
          }
        },
        {
          "start": "2023-10-06T19:30:00Z",
          "end": "2023-10-06T19:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T19:15:00Z",
          "end": "2023-10-06T19:30:00Z",
          "values": {
            "averageSecondsInQueue": 301.003,
            "p95SecondsInQueue": 301.204,
            "count": 2,
            "p50SecondsInQueue": 301.204
          }
        },
        {
          "start": "2023-10-06T19:00:00Z",
          "end": "2023-10-06T19:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T18:45:00Z",
          "end": "2023-10-06T19:00:00Z",
          "values": {
            "averageSecondsInQueue": 300.7185,
            "p95SecondsInQueue": 301.372,
            "count": 2,
            "p50SecondsInQueue": 301.372
          }
        },
        {
          "start": "2023-10-06T18:30:00Z",
          "end": "2023-10-06T18:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        }
      ],
      "dimensions": {
        "result": {
          "data": "EXPIRED",
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingRequests?groupBy=result"
          }
        },
        "gameCenterDetail": {
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingRequests?groupBy=gameCenterDetail"
          }
        }
      },
      "granularity": 900
    },
    {
      "type": "gameCenterMatchmakingQueueRequests",
      "dataPoints": [
        {
          "start": "2023-10-07T02:15:00Z",
          "end": "2023-10-07T02:30:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T02:00:00Z",
          "end": "2023-10-07T02:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T01:45:00Z",
          "end": "2023-10-07T02:00:00Z",
          "values": {
            "averageSecondsInQueue": 3.07875,
            "p95SecondsInQueue": 3.289,
            "count": 4,
            "p50SecondsInQueue": 3.153
          }
        },
        {
          "start": "2023-10-07T01:30:00Z",
          "end": "2023-10-07T01:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T01:15:00Z",
          "end": "2023-10-07T01:30:00Z",
          "values": {
            "averageSecondsInQueue": 3.2365,
            "p95SecondsInQueue": 3.342,
            "count": 4,
            "p50SecondsInQueue": 3.268
          }
        },
        {
          "start": "2023-10-07T01:00:00Z",
          "end": "2023-10-07T01:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T00:45:00Z",
          "end": "2023-10-07T01:00:00Z",
          "values": {
            "averageSecondsInQueue": 3.20825,
            "p95SecondsInQueue": 3.411,
            "count": 4,
            "p50SecondsInQueue": 3.278
          }
        },
        {
          "start": "2023-10-07T00:30:00Z",
          "end": "2023-10-07T00:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-07T00:15:00Z",
          "end": "2023-10-07T00:30:00Z",
          "values": {
            "averageSecondsInQueue": 3.521,
            "p95SecondsInQueue": 3.586,
            "count": 4,
            "p50SecondsInQueue": 3.542
          }
        },
        {
          "start": "2023-10-07T00:00:00Z",
          "end": "2023-10-07T00:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T23:45:00Z",
          "end": "2023-10-07T00:00:00Z",
          "values": {
            "averageSecondsInQueue": 2.8755,
            "p95SecondsInQueue": 3.145,
            "count": 4,
            "p50SecondsInQueue": 2.965
          }
        },
        {
          "start": "2023-10-06T23:30:00Z",
          "end": "2023-10-06T23:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T23:15:00Z",
          "end": "2023-10-06T23:30:00Z",
          "values": {
            "averageSecondsInQueue": 3.4875,
            "p95SecondsInQueue": 3.586,
            "count": 4,
            "p50SecondsInQueue": 3.523
          }
        },
        {
          "start": "2023-10-06T23:00:00Z",
          "end": "2023-10-06T23:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T22:45:00Z",
          "end": "2023-10-06T23:00:00Z",
          "values": {
            "averageSecondsInQueue": 3.20225,
            "p95SecondsInQueue": 3.413,
            "count": 4,
            "p50SecondsInQueue": 3.276
          }
        },
        {
          "start": "2023-10-06T22:30:00Z",
          "end": "2023-10-06T22:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T22:15:00Z",
          "end": "2023-10-06T22:30:00Z",
          "values": {
            "averageSecondsInQueue": 3.3585,
            "p95SecondsInQueue": 3.459,
            "count": 4,
            "p50SecondsInQueue": 3.389
          }
        },
        {
          "start": "2023-10-06T22:00:00Z",
          "end": "2023-10-06T22:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T21:45:00Z",
          "end": "2023-10-06T22:00:00Z",
          "values": {
            "averageSecondsInQueue": 3.198,
            "p95SecondsInQueue": 3.437,
            "count": 4,
            "p50SecondsInQueue": 3.262
          }
        },
        {
          "start": "2023-10-06T21:30:00Z",
          "end": "2023-10-06T21:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T21:15:00Z",
          "end": "2023-10-06T21:30:00Z",
          "values": {
            "averageSecondsInQueue": 3.259,
            "p95SecondsInQueue": 3.361,
            "count": 4,
            "p50SecondsInQueue": 3.291
          }
        },
        {
          "start": "2023-10-06T21:00:00Z",
          "end": "2023-10-06T21:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T20:45:00Z",
          "end": "2023-10-06T21:00:00Z",
          "values": {
            "averageSecondsInQueue": 3.1095,
            "p95SecondsInQueue": 3.315,
            "count": 4,
            "p50SecondsInQueue": 3.179
          }
        },
        {
          "start": "2023-10-06T20:30:00Z",
          "end": "2023-10-06T20:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T20:15:00Z",
          "end": "2023-10-06T20:30:00Z",
          "values": {
            "averageSecondsInQueue": 3.1255,
            "p95SecondsInQueue": 3.22,
            "count": 4,
            "p50SecondsInQueue": 3.159
          }
        },
        {
          "start": "2023-10-06T20:00:00Z",
          "end": "2023-10-06T20:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T19:45:00Z",
          "end": "2023-10-06T20:00:00Z",
          "values": {
            "averageSecondsInQueue": 2.9295,
            "p95SecondsInQueue": 3.144,
            "count": 4,
            "p50SecondsInQueue": 2.998
          }
        },
        {
          "start": "2023-10-06T19:30:00Z",
          "end": "2023-10-06T19:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T19:15:00Z",
          "end": "2023-10-06T19:30:00Z",
          "values": {
            "averageSecondsInQueue": 3.47925,
            "p95SecondsInQueue": 3.547,
            "count": 4,
            "p50SecondsInQueue": 3.502
          }
        },
        {
          "start": "2023-10-06T19:00:00Z",
          "end": "2023-10-06T19:15:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        },
        {
          "start": "2023-10-06T18:45:00Z",
          "end": "2023-10-06T19:00:00Z",
          "values": {
            "averageSecondsInQueue": 3.04725,
            "p95SecondsInQueue": 3.25,
            "count": 4,
            "p50SecondsInQueue": 3.116
          }
        },
        {
          "start": "2023-10-06T18:30:00Z",
          "end": "2023-10-06T18:45:00Z",
          "values": {
            "averageSecondsInQueue": 0,
            "p95SecondsInQueue": 0,
            "count": 0,
            "p50SecondsInQueue": 0
          }
        }
      ],
      "dimensions": {
        "result": {
          "data": "MATCHED",
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingRequests?groupBy=result"
          }
        },
        "gameCenterDetail": {
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingRequests?groupBy=gameCenterDetail"
          }
        }
      },
      "granularity": 900
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingRequests?granularity=PT15M&groupBy=result"
  },
  "meta": {
    "paging": {
      "total": 3,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)