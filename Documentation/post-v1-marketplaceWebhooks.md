<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 - 4.0.1"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-marketplaceWebhooks",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-marketplaceWebhooks"
  },
  "title" : "Add a Marketplace Webhook Configuration"
}
-->

# Add a Marketplace Webhook Configuration

Add a new endpoint URL and secret for alternative distribution package notifications.

## Discussion

Each developer account has a single marketplace webhooks `endpointUrl`, so if you operate mutliple marketplaces all notifications come to a single endpoint. The notification payload contains the `marketplaceAppId.`

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/marketplaceWebhooks
{
  "data": {
    "type": "marketplaceWebhooks",
    "attributes": {
      "endpointUrl": "https://example.com/api/ingest/notifications",
      "secret": "mysecretstring"
    }
  }
}
```

**Response:**

```json
{
  “data”: [
    {
      “type”: “marketplaceWebhooks”,
      “id”: “c74970b8-6be0-40fa-8f51-8e1532005635”,
      “attributes”: {
        “endpointUrl”: “https://example.com/api/ingest/notifications”
      },
      “links”: {
        “self”: “https://api.appstoreconnect.apple.com/v1/marketplaceWebhooks/c74970b8-6be0-40fa-8f51-8e1532005635”
      }
    }
  ],
  “links”: {
    “self”: “https://api.appstoreconnect.apple.com/v1/marketplaceWebhooks”
  },
  “meta”: {
    “paging”: {
      “total”: 1,
      “limit”: 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)