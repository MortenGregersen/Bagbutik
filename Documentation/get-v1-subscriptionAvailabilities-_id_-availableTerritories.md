<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 - 4.4.0"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-subscriptionAvailabilities-_id_-availableTerritories",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-subscriptionAvailabilities-{}-availableTerritories"
  },
  "title" : "List the territory availability of a subscription"
}
-->

# List the territory availability of a subscription

List the territory availability and currency of a specific subscription.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/subscriptionAvailabilities/6447589418/availableTerritories?limit=5
```

**Response:**

```json
{
  "data" : [ {
    "type" : "territories",
    "id" : "SLV",
    "attributes" : {
      "currency" : "USD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/SLV"
    }
  }, {
    "type" : "territories",
    "id" : "BRB",
    "attributes" : {
      "currency" : "USD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/BRB"
    }
  }, {
    "type" : "territories",
    "id" : "CYM",
    "attributes" : {
      "currency" : "USD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/CYM"
    }
  }, {
    "type" : "territories",
    "id" : "NIC",
    "attributes" : {
      "currency" : "USD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/NIC"
    }
  }, {
    "type" : "territories",
    "id" : "NAM",
    "attributes" : {
      "currency" : "USD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/NAM"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionAvailabilities/6447589418/availableTerritories?limit=5",
    "next" : "https://api.appstoreconnect.apple.com/v1/subscriptionAvailabilities/6447589418/availableTerritories?cursor=BQ.AO4JFxQ&limit=5"
  },
  "meta" : {
    "paging" : {
      "total" : 175,
      "limit" : 5
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)