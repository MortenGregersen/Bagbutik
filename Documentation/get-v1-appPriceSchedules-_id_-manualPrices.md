<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appPriceSchedules-_id_-manualPrices",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appPriceSchedules-{}-manualPrices"
  },
  "title" : "List Manually Chosen Prices for an App"
}
-->

# List Manually Chosen Prices for an App

List the prices you chose for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/manualPrices?limit=200&include=appPricePoint,territory&fields%5BappPricePoints%5D=customerPrice&filter%5Bterritory%5D=USA,CAN&fields%5Bterritories%5D=currency
```

**Response:**

```json
{
  "data" : [ {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDciLCJzZCI6MC4wLCJlZCI6MC4wfQ",
    "attributes" : {
      "manual" : true,
      "startDate" : null,
      "endDate" : null
    },
    "relationships" : {
      "appPricePoint" : {
        "data" : {
          "type" : "appPricePoints",
          "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDcifQ"
        }
      },
      "territory" : {
        "data" : {
          "type" : "territories",
          "id" : "CAN"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDciLCJzZCI6MC4wLCJlZCI6MC4wfQ"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDciLCJzZCI6MC4wLCJlZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDB9",
    "attributes" : {
      "manual" : true,
      "startDate" : null,
      "endDate" : "2023-02-28"
    },
    "relationships" : {
      "appPricePoint" : {
        "data" : {
          "type" : "appPricePoints",
          "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDcifQ"
        }
      },
      "territory" : {
        "data" : {
          "type" : "territories",
          "id" : "USA"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDciLCJzZCI6MC4wLCJlZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDB9"
    }
  } ],
  "included" : [ {
    "type" : "appPricePoints",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDcifQ",
    "attributes" : {
      "customerPrice" : "9.99"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDcifQ"
    }
  }, {
    "type" : "territories",
    "id" : "CAN",
    "attributes" : {
      "currency" : "CAD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/CAN"
    }
  }, {
    "type" : "appPricePoints",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDcifQ",
    "attributes" : {
      "customerPrice" : "0.89"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDcifQ"
    }
  }, {
    "type" : "territories",
    "id" : "USA",
    "attributes" : {
      "currency" : "USD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/USA"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/manualPrices?include=appPricePoint%2Cterritory&fields%5BappPricePoints%5D=customerPrice&filter%5Bterritory%5D=CAN%2CUSA&limit=200&fields%5Bterritories%5D=currency"
  },
  "meta" : {
    "paging" : {
      "total" : 2,
      "limit" : 200
    }
  }
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)