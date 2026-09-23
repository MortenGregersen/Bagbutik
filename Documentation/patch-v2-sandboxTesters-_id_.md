<!--
{
  "availability" : [
    "App Store Connect API: 2.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v2-sandboxTesters-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v2-sandboxTesters-{}"
  },
  "title" : "Modify a sandbox tester"
}
-->

# Modify a sandbox tester

Change the subscription renewal time rate, set interrupted purchases or change territory of Sandbox Apple Account.

## Discussion

> Note:
> Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v2/sandboxTesters/47be9e57-1a3f-49c2-8ce7-af27a977ebb0
```

**Response:**

```json
{
  "data" : {
    "type" : "sandboxTesters",
    "id" : "47be9e57-1a3f-49c2-8ce7-af27a977ebb0",
    "attributes" : {
      "firstName" : "Anne",
      "lastName" : "Johnson",
      "acAccountName" : "annejohnson1@icloud.com",
      "territory" : "CAN",
      "applePayCompatible" : true,
      "interruptPurchases" : false,
      "subscriptionRenewalRate" : "MONTHLY_RENEWAL_EVERY_THIRTY_MINUTES"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTesters/47be9e57-1a3f-49c2-8ce7-af27a977ebb0"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTesters/47be9e57-1a3f-49c2-8ce7-af27a977ebb0"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)