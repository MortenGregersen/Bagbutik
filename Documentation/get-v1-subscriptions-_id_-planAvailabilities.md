<!--
{
  "availability" : [
    "App Store Connect API: 4.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-subscriptions-_id_-planAvailabilities",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-subscriptions-{}-planAvailabilities"
  },
  "title" : "List plan availabilities for a subscription"
}
-->

# List plan availabilities for a subscription

List all plan availabilities for a specific auto-renewable subscription.

## Overview

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/subscriptions/6470878936/planAvailabilities?limit=2
```

**Response:**

```json
{
  "data" : [ {
    "type" : "subscriptionPlanAvailabilities",
    "id" : "eyJhIjoiNjQ3MDg3ODkzNiIsInAiOiIwIn0",
    "attributes" : {
      "availableInNewTerritories" : true,
      "planType" : "UPFRONT"
    },
    "relationships" : {
      "availableTerritories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionPlanAvailabilities/eyJhIjoiNjQ3MDg3ODkzNiIsInAiOiIwIn0/relationships/availableTerritories",
          "related" : "https://api.appstoreconnect.apple.com/v1/subscriptionPlanAvailabilities/eyJhIjoiNjQ3MDg3ODkzNiIsInAiOiIwIn0/availableTerritories"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionPlanAvailabilities/eyJhIjoiNjQ3MDg3ODkzNiIsInAiOiIwIn0"
    }
  } ],
  "meta" : {
    "paging" : { "total" : 1, "limit" : 2 }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)