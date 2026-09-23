<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionKeys-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-alternativeDistributionKeys-{}"
  },
  "title" : "Read Alternative Distribution Key Information"
}
-->

# Read Alternative Distribution Key Information

Read the public key information for a specific alternative distribution key.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/distributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6
```

**Response:**

```json
{
  "data" : {
    "type" : "distributionKeys",
    "id" : "52c5cb04-1163-4a30-ad4f-a3433cd6a4f6",
    "attributes" : {
      "publicKey" : "-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEFQUkD1YB67wg3e0VD/2c3N3Wf92n
uQqDgFZuYG/NcYLwT3Zdw77s6//8XSI2NYv7WNgUONxMj+j65Qijq4/fhw==
-----END PUBLIC KEY-----"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/distributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/distributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)