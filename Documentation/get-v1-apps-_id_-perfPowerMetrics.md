<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-perfPowerMetrics",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-perfPowerMetrics"
  },
  "title" : "Get power and performance metrics for an app"
}
-->

# Get power and performance metrics for an app

Get the performance and power metrics data for the most recent version of an app.

## Discussion

The example below requests iOS app launch metrics on all iPhones for the most-recent app versions. To get metrics for a specific app version instead, use the [`Get power and performance metrics for a build`](/documentation/AppStoreConnectAPI/GET-v1-builds-_id_-perfPowerMetrics) endpoint.

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/161309721/perfPowerMetrics?filter[deviceType]=all_iphones&filter[metricType]=LAUNCH&filter[platform]=iOS
```

**Response:**

```json
{
  "version": "1.0.0",
  "insights": {
    "regressions": [
      {
        "latestVersion": "2.0",
        "maxLatestVersionValue": 2014.3,
        "metric": "launchTime",
        "metricCategory": "LAUNCH",
        "populations": [
          {
            "deltaPercentage": 10,
            "device": "all_iphones",
            "latestVersionValue": 997.8,
            "percentile": "percentile.fifty",
            "referenceAverageValue": 907.48,
            "summaryString": "Increased 10% across iPhone (All)"
          },
          {
            "deltaPercentage": 13,
            "device": "all_iphones",
            "latestVersionValue": 2014.3,
            "percentile": "percentile.ninety",
            "referenceAverageValue": 1777.88,
            "summaryString": "Increased 13% across iPhone (All)"
          }
        ],
        "referenceVersions": ["1.0", "1.1", "1.2", "1.3"],
        "summaryString": "Top (90th percentile) and typical (50th percentile) Launch Time trended up between app versions 1.0 to 2.0 on iPhone (All). The maximum value for the latest app version is at 2014.30 ms and increased between 10% to 13% compared to the average for previous 4 app versions."
      }
    ],
    "trendingUp": []
  },
  "productData": [
    {
      "platform": "iOS",
      "metricCategories": [
        {
          "identifier": "LAUNCH",
          "metrics": [
            {
              "identifier": "launchTime",
              "unit": {
                "displayName": "ms",
                "identifier": "milliseconds"
              },
              "datasets": [
                {
                  "filterCriteria": {
                    "device": "all_iphones",
                    "deviceMarketingName": "All iPhones",
                    "percentile": "percentile.fifty"
                  },
                  "points": [
                    {
                      "value": 768.7,
                      "version": "1.0"
                    },
                    {
                      "value": 750,
                      "version": "1.1"
                    },
                    {
                      "value": 992.3,
                      "version": "1.2"
                    },
                    {
                      "value": 1118.9,
                      "version": "1.3"
                    },
                    {
                      "value": 997.8,
                      "version": "2.0"
                    }
                  ]
                },
                {
                  "filterCriteria": {
                    "device": "all_iphones",
                    "deviceMarketingName": "All iPhones",
                    "percentile": "percentile.ninety"
                  },
                  "points": [
                    {
                      "value": 1532.1,
                      "version": "1.0"
                    },
                    {
                      "value": 1390.2,
                      "version": "1.1"
                    },
                    {
                      "value": 2030.8,
                      "version": "1.2"
                    },
                    {
                      "value": 2158.4,
                      "version": "1.3"
                    },
                    {
                      "value": 2014.3,
                      "version": "2.0"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)