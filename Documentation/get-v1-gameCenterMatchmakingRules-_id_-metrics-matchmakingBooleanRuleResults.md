<!--
{
  "availability" : [
    "App Store Connect API: 3.1.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterMatchmakingRules-_id_-metrics-matchmakingBooleanRuleResults",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterMatchmakingRules-{}-metrics-matchmakingBooleanRuleResults"
  },
  "title" : "Get boolean rule results"
}
-->

# Get boolean rule results

Get the results of a specific matchmaking rule that returns Boolean values.

## Discussion

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?granularity=PT15M&groupBy=result
```

**Response:**

```json
{
  "data": [
    {
      "type": "gameCenterMatchmakingBooleanRuleResults",
      "dataPoints": [
        {
          "start": "2023-10-07T02:15:00Z",
          "end": "2023-10-07T02:30:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T02:00:00Z",
          "end": "2023-10-07T02:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T01:45:00Z",
          "end": "2023-10-07T02:00:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-07T01:30:00Z",
          "end": "2023-10-07T01:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T01:15:00Z",
          "end": "2023-10-07T01:30:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-07T01:00:00Z",
          "end": "2023-10-07T01:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T00:45:00Z",
          "end": "2023-10-07T01:00:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-07T00:30:00Z",
          "end": "2023-10-07T00:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T00:15:00Z",
          "end": "2023-10-07T00:30:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-07T00:00:00Z",
          "end": "2023-10-07T00:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T23:45:00Z",
          "end": "2023-10-07T00:00:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T23:30:00Z",
          "end": "2023-10-06T23:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T23:15:00Z",
          "end": "2023-10-06T23:30:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T23:00:00Z",
          "end": "2023-10-06T23:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T22:45:00Z",
          "end": "2023-10-06T23:00:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T22:30:00Z",
          "end": "2023-10-06T22:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T22:15:00Z",
          "end": "2023-10-06T22:30:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T22:00:00Z",
          "end": "2023-10-06T22:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T21:45:00Z",
          "end": "2023-10-06T22:00:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T21:30:00Z",
          "end": "2023-10-06T21:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T21:15:00Z",
          "end": "2023-10-06T21:30:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T21:00:00Z",
          "end": "2023-10-06T21:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T20:45:00Z",
          "end": "2023-10-06T21:00:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T20:30:00Z",
          "end": "2023-10-06T20:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T20:15:00Z",
          "end": "2023-10-06T20:30:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T20:00:00Z",
          "end": "2023-10-06T20:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T19:45:00Z",
          "end": "2023-10-06T20:00:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T19:30:00Z",
          "end": "2023-10-06T19:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T19:15:00Z",
          "end": "2023-10-06T19:30:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T19:00:00Z",
          "end": "2023-10-06T19:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T18:45:00Z",
          "end": "2023-10-06T19:00:00Z",
          "values": {
            "count": 14
          }
        },
        {
          "start": "2023-10-06T18:30:00Z",
          "end": "2023-10-06T18:45:00Z",
          "values": {
            "count": 0
          }
        }
      ],
      "dimensions": {
        "result": {
          "data": true,
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?groupBy=result"
          }
        },
        "gameCenterMatchmakingQueue": {
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?groupBy=gameCenterMatchmakingQueue"
          }
        }
      },
      "granularity": 900
    },
    {
      "type": "gameCenterMatchmakingBooleanRuleResults",
      "dataPoints": [
        {
          "start": "2023-10-07T02:15:00Z",
          "end": "2023-10-07T02:30:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T02:00:00Z",
          "end": "2023-10-07T02:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T01:45:00Z",
          "end": "2023-10-07T02:00:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-07T01:30:00Z",
          "end": "2023-10-07T01:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T01:15:00Z",
          "end": "2023-10-07T01:30:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-07T01:00:00Z",
          "end": "2023-10-07T01:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T00:45:00Z",
          "end": "2023-10-07T01:00:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-07T00:30:00Z",
          "end": "2023-10-07T00:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-07T00:15:00Z",
          "end": "2023-10-07T00:30:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-07T00:00:00Z",
          "end": "2023-10-07T00:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T23:45:00Z",
          "end": "2023-10-07T00:00:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T23:30:00Z",
          "end": "2023-10-06T23:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T23:15:00Z",
          "end": "2023-10-06T23:30:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T23:00:00Z",
          "end": "2023-10-06T23:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T22:45:00Z",
          "end": "2023-10-06T23:00:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T22:30:00Z",
          "end": "2023-10-06T22:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T22:15:00Z",
          "end": "2023-10-06T22:30:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T22:00:00Z",
          "end": "2023-10-06T22:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T21:45:00Z",
          "end": "2023-10-06T22:00:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T21:30:00Z",
          "end": "2023-10-06T21:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T21:15:00Z",
          "end": "2023-10-06T21:30:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T21:00:00Z",
          "end": "2023-10-06T21:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T20:45:00Z",
          "end": "2023-10-06T21:00:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T20:30:00Z",
          "end": "2023-10-06T20:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T20:15:00Z",
          "end": "2023-10-06T20:30:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T20:00:00Z",
          "end": "2023-10-06T20:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T19:45:00Z",
          "end": "2023-10-06T20:00:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T19:30:00Z",
          "end": "2023-10-06T19:45:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T19:15:00Z",
          "end": "2023-10-06T19:30:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T19:00:00Z",
          "end": "2023-10-06T19:15:00Z",
          "values": {
            "count": 0
          }
        },
        {
          "start": "2023-10-06T18:45:00Z",
          "end": "2023-10-06T19:00:00Z",
          "values": {
            "count": 4
          }
        },
        {
          "start": "2023-10-06T18:30:00Z",
          "end": "2023-10-06T18:45:00Z",
          "values": {
            "count": 0
          }
        }
      ],
      "dimensions": {
        "result": {
          "data": false,
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?groupBy=result"
          }
        },
        "gameCenterMatchmakingQueue": {
          "links": {
            "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?groupBy=gameCenterMatchmakingQueue"
          }
        }
      },
      "granularity": 900
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?granularity=PT15M&groupBy=result"
  },
  "meta": {
    "paging": {
      "total": 2,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)