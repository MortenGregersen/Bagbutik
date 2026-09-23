<!--
{
  "availability" : [
    "App Store Connect API: 2.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-subscriptions-_id_-pricePoints",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-subscriptions-{}-pricePoints"
  },
  "title" : "List all price points for a subscription"
}
-->

# List all price points for a subscription

Get a list of price points for an auto-renewable subscription by territory.

## Overview

### Discussion

> Important:
> Use the `territory` filter on all requests. This will be required in a future release.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/subscriptions/6470878936/pricePoints?filter[territory]=USA&include=territory&limit=2
```

**Response:**

```json
{
  "data" : [ {
    "type" : "subscriptionPricePoints",
    "id" : "eyJzIjoiNjQ3MDg3ODkzNiIsInQiOiJVU0EiLCJwIjoiMTAwMDEifQ",
    "attributes" : {
      "customerPrice" : "0.29",
      "proceeds" : "0.21",
      "proceedsYear2" : "0.25"
    },
    "relationships" : {
      "territory" : {
        "data" : { "type" : "territories", "id" : "USA" }
      },
      "adjustedEqualizations" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionPricePoints/eyJzIjoiNjQ3MDg3ODkzNiIsInQiOiJVU0EiLCJwIjoiMTAwMDEifQ/relationships/adjustedEqualizations",
          "related" : "https://api.appstoreconnect.apple.com/v1/subscriptionPricePoints/eyJzIjoiNjQ3MDg3ODkzNiIsInQiOiJVU0EiLCJwIjoiMTAwMDEifQ/adjustedEqualizations"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionPricePoints/eyJzIjoiNjQ3MDg3ODkzNiIsInQiOiJVU0EiLCJwIjoiMTAwMDEifQ"
    }
  } ],
  "included" : [ {
    "type" : "territories",
    "id" : "USA",
    "attributes" : { "currency" : "USD" }
  } ],
  "meta" : {
    "paging" : { "total" : 900, "limit" : 2 }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)