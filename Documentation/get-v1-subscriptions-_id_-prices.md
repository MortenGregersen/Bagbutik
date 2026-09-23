<!--
{
  "availability" : [
    "App Store Connect API: 2.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-subscriptions-_id_-prices",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-subscriptions-{}-prices"
  },
  "title" : "List all prices for a subscription"
}
-->

# List all prices for a subscription

Get a list of prices for an auto-renewable subscription, by territory.

## Overview

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/subscriptions/6470878936/prices?filter[territory]=USA&include=subscriptionPricePoint,territory&limit=2
```

**Response:**

```json
{
  "data" : [ {
    "type" : "subscriptionPrices",
    "id" : "eyJhIjoiNjQ3MDg3ODkzNiIsImMiOiJVUyIsImQiOjAsInAiOiIwIn0",
    "attributes" : {
      "startDate" : null,
      "preserved" : true,
      "planType" : "UPFRONT"
    },
    "relationships" : {
      "territory" : {
        "data" : { "type" : "territories", "id" : "USA" }
      },
      "subscriptionPricePoint" : {
        "data" : { "type" : "subscriptionPricePoints", "id" : "eyJzIjoiNjQ3MDg3ODkzNiIsInQiOiJVU0EiLCJwIjoiMTAwMTAifQ" }
      }
    }
  }, {
    "type" : "subscriptionPrices",
    "id" : "eyJhIjoiNjQ3MDg3ODkzNiIsImMiOiJVUyIsImQiOjIwMTUwLCJwIjoiMCJ9",
    "attributes" : {
      "startDate" : "2025-03-03",
      "preserved" : false,
      "planType" : "UPFRONT"
    },
    "relationships" : {
      "territory" : {
        "data" : { "type" : "territories", "id" : "USA" }
      },
      "subscriptionPricePoint" : {
        "data" : { "type" : "subscriptionPricePoints", "id" : "eyJzIjoiNjQ3MDg3ODkzNiIsInQiOiJVU0EiLCJwIjoiMTAwMzYifQ" }
      }
    }
  } ],
  "included" : [ {
    "type" : "territories",
    "id" : "USA",
    "attributes" : { "currency" : "USD" }
  }, {
    "type" : "subscriptionPricePoints",
    "id" : "eyJzIjoiNjQ3MDg3ODkzNiIsInQiOiJVU0EiLCJwIjoiMTAwMTAifQ",
    "attributes" : { "customerPrice" : "0.99", "proceeds" : "0.7", "proceedsYear2" : "0.84" }
  }, {
    "type" : "subscriptionPricePoints",
    "id" : "eyJzIjoiNjQ3MDg3ODkzNiIsInQiOiJVU0EiLCJwIjoiMTAwMzYifQ",
    "attributes" : { "customerPrice" : "2.99", "proceeds" : "2.1", "proceedsYear2" : "2.54" }
  } ],
  "meta" : {
    "paging" : { "total" : 2, "limit" : 2 }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)