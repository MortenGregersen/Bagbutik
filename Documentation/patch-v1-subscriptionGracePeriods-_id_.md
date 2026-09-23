<!--
{
  "availability" : [
    "App Store Connect API: 2.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v1-subscriptionGracePeriods-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v1-subscriptionGracePeriods-{}"
  },
  "title" : "Modify the billing grace period opt-in status and duration"
}
-->

# Modify the billing grace period opt-in status and duration

Change the Boolean value representing the billing grace period opt-in status.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/subscriptionGracePeriods/6446671329     
-d $'{
  "data": {
    "type": "subscriptionGracePeriods",
    "id": "6446671329",
    "attributes": {
      "sandboxOptIn": true,
      "optIn": true,
      "renewalType": "PAID_TO_PAID_ONLY",
      "duration": "TWENTY_EIGHT_DAYS"
    }
  }
}'
```

**Response:**

```json
{
  "data" : {
    "type" : "subscriptionGracePeriods",
    "id" : "6446671329",
    "attributes" : {
      "optIn" : true,
      "sandboxOptIn" : true,
      "duration" : "TWENTY_EIGHT_DAYS",
      "renewalType" : "PAID_TO_PAID_ONLY"
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