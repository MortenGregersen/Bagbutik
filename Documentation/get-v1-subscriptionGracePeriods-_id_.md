<!--
{
  "availability" : [
    "App Store Connect API: 2.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-subscriptionGracePeriods-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-subscriptionGracePeriods-{}"
  },
  "title" : "Read the billing grace period value"
}
-->

# Read the billing grace period value

Get the Boolean value that represents the billing grace period opt-in state and the duration of the billing grace period.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/subscriptionGracePeriods/6446671329
```

**Response:**

```json
{
  "data" : {
    "type" : "subscriptionGracePeriods",
    "id" : "6446671329",
    "attributes" : {
      "optIn" : true,
      "sandboxOptIn" : false,
      "duration" : "THREE_DAYS",
      "renewalType" : "ALL_RENEWALS"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionGracePeriods/6446671329"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionGracePeriods/6446671329"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)