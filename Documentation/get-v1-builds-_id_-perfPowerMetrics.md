<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-builds-_id_-perfPowerMetrics",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-builds-{}-perfPowerMetrics"
  },
  "title" : "Get power and performance metrics for a build"
}
-->

# Get power and performance metrics for a build

Get the performance and power metrics data for a specific build.

## Discussion

The example below requests iOS animation metrics on all iPads for a specific build. To get the metrics for all of the most-recent app versions instead, use the [`Get power and performance metrics for an app`](/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-perfPowerMetrics) endpoint.

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/builds/43d3a970-273c-4bc9-88ee-aa5c05610ac1/perfPowerMetrics?filter[deviceType]=all_ipads&filter[metricType]=ANIMATION&filter[platform]=iOS
```

**Response:**

```json
{
  "productData": [
    {
      "platform": "iOS",
      "metricCategories": [
        {
          "identifier": "ANIMATION",
          "metrics": [
            {
              "identifier": "scrollHitchRate",
              "unit": {
                "identifier": "scrollHitchRate",
                "displayName": "%"
              },
              "datasets": [
                {
                  "filterCriteria": {
                    "percentile": "percentile.fifty",
                    "device": "all_ipads",
                    "deviceMarketingName": "All iPads"
                  },
                  "points": [
                    {
                      "version": "10.0",
                      "value": 6.5,
                      "goal": "fair"
                    }
                  ]
                },
                {
                  "filterCriteria": {
                    "percentile": "percentile.ninety",
                    "device": "all_ipads",
                    "deviceMarketingName": "All iPads"
                  },
                  "points": [
                    {
                      "version": "10.0",
                      "value": 29.7,
                      "goal": "poor"
                    }
                  ]
                }
              ],
              "goalKeys": [
                {
                  "goalKey": "poor",
                  "lowerBound": 10
                },
                {
                  "upperBound": 10,
                  "goalKey": "fair",
                  "lowerBound": 5
                },
                {
                  "upperBound": 5,
                  "goalKey": "good",
                  "lowerBound": 0
                }
              ]
            }
          ]
        }
      ]
    }
  ],
  "version": "1.0.0"
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)