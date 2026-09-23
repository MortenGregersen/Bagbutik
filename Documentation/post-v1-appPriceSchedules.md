<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-appPriceSchedules",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-appPriceSchedules"
  },
  "title" : "Add a Scheduled Price Change to an App"
}
-->

# Add a Scheduled Price Change to an App

Create a scheduled price change for an app.

## Discussion

> Warning:
> If you use this endpoint to add a scheduled price change to your app, you can’t use `AppPriceInlineCreate` to change your app’s price.

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/appPriceSchedules
```

**Response:**

```json
{
  "data": {
    "type": "appPriceSchedules",
    "attributes": {},
    "relationships": {
      "app": {
        "data": {
          "type": "apps",
          "id": "6447402192"
        }
      },
      "manualPrices": {
        "data": [
          {
            "type": "appPrices",
            "id": "${newprice-0}"
          },
          {
            "type": "appPrices",
            "id": "${newprice-1}"
          },
          {
            "type": "appPrices",
            "id": "${newprice-2}"
          },
          {
            "type": "appPrices",
            "id": "${newprice-3}"
          }
        ]
      },
      "baseTerritory": {
        "data": {
          "type": "territories",
          "id": "CAN"
        }
      }
    }
  },
  "included": [
    {
      "id": "${newprice-0}",
      "relationships": {
        "appPricePoint": {
          "data": {
            "type": "appPricePoints",
            "id": "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBTEIiLCJwIjoiMTAwMTQifQ"
          }
        }
      },
      "type": "appPrices",
      "attributes": {
        "startDate": null,
        "endDate": "2023-03-11"
      }
    },
    {
      "id": "${newprice-1}",
      "relationships": {
        "appPricePoint": {
          "data": {
            "type": "appPricePoints",
            "id": "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBUkciLCJwIjoiMTAwMzQifQ"
          }
        }
      },
      "type": "appPrices",
      "attributes": {
        "startDate": null,
        "endDate": "2023-03-11"
      }
    },
    {
      "id": "${newprice-2}",
      "relationships": {
        "appPricePoint": {
          "data": {
            "type": "appPricePoints",
            "id": "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDcifQ"
          }
        }
      },
      "type": "appPrices",
      "attributes": {
        "startDate": null,
        "endDate": "2023-03-11"
      }
    },
    {
      "id": "${newprice-3}",
      "relationships": {
        "appPricePoint": {
          "data": {
            "type": "appPricePoints",
            "id": "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMTAifQ"
          }
        }
      },
      "type": "appPrices",
      "attributes": {
        "startDate": "2023-03-11",
        "endDate": null
      }
    }
  ]
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)