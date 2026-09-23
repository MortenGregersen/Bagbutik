<!--
{
  "availability" : [
    "App Store Connect API: 2.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v2-sandboxTesters",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v2-sandboxTesters"
  },
  "title" : "List sandbox testers"
}
-->

# List sandbox testers

Get a list of Sandbox Testers for your team.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v2/sandboxTesters
```

**Response:**

```json
{
  "data" : [ {
    "type" : "sandboxTesters",
    "id" : "47be9e57-1a3f-49c2-8ce7-af27a977ebb0",
    "attributes" : {
      "firstName" : "Anne",
      "lastName" : "Johnson",
      "acAccountName" : "annejohnson1@icloud.com",
      "territory" : "USA",
      "applePayCompatible" : true,
      "interruptPurchases" : false,
      "subscriptionRenewalRate" : "MONTHLY_RENEWAL_EVERY_FIVE_MINUTES"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTesters/47be9e57-1a3f-49c2-8ce7-af27a977ebb0"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTesters"
  },
  "meta" : {
    "paging" : {
      "total" : 1,
      "limit" : 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)