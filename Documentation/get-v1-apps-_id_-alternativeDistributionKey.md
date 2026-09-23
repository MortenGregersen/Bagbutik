<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-alternativeDistributionKey",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-alternativeDistributionKey"
  },
  "title" : "Read an App’s Alternative Distribution Key"
}
-->

# Read an App’s Alternative Distribution Key

Get the alternative distribution keys for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6473805491/alternativeDistributionKey
```

**Response:**

```json
{
  “data” : {
    “type” : “alternativeDistributionKeys”,
    “id” : “52c5cb04-1163-4a30-ad4f-a3433cd6a4f6”,
    “attributes” : {
      “publicKey” : “-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE7rsxeCw+hrwRgStk0J2vYmnGQZhagSt0fm511aTjpDVsaIy9z7jmUKjJ1jgb8P5UKmQfmw0ovD+fNTSefjrw5A==-----END PUBLIC KEY-----”
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6”
    }
  },
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/apps/6473805491/alternativeDistributionKey”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)