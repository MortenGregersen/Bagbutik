<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 - 4.4.0"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-subscriptionAvailabilities-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-subscriptionAvailabilities-{}"
  },
  "title" : "Read the availability of a subscription"
}
-->

# Read the availability of a subscription

Get information about the territory availability for a subscription.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/subscriptionAvailabilities/6447589418
```

**Response:**

```json
{
  "data" : {
    "type" : "subscriptionAvailabilities",
    "id" : "6447589418",
    "attributes" : {
      "availableInNewTerritories" : false
    },
    "relationships" : {
      "availableTerritories" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionAvailabilities/6447589418/relationships/availableTerritories",
          "related" : "https://api.appstoreconnect.apple.com/v1/subscriptionAvailabilities/6447589418/availableTerritories"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionAvailabilities/6447589418"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionAvailabilities/6447589418"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)