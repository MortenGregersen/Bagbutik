<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-alternativeDistributionKeys",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-alternativeDistributionKeys"
  },
  "title" : "Add an Alternative Distribution Key"
}
-->

# Add an Alternative Distribution Key

Add an alternative distribution key for your alternative marketplace app or web distribution.

## Discussion

You can use a single alternative distribution key for all alternative distribution apps on your account. You can optionally use an app specific alternative distribution key, by adding a relationship to a specific app in the JSON payload used with this endpoint.

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys
{
  "data": {
    "type": "alternativeDistributionKeys",
    "id": null,
    "attributes": {
      "publicKey": "-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DA7021gAEFQUkD1YB67wg3e0VD/2c3N3Wf92nuQqDgFZuYG/NcYLwT3Zdw77s6//8XSI2NYv7WNgUONxMj+j65Qijq4/fhw==-----END PUBLIC KEY-----"
    }
  }
}
```

**Response:**

```json
{
  “data” : {
    “type” : “alternativeDistributionKeys”,
    “id” : “52c5cb04-1163-65ar-36aa-a3433cd6a4f6”,
    “attributes” : {
      “publicKey” : “-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DA7021gAEFQUkD1YB67wg3e0VD/2c3N3Wf92nuQqDgFZuYG/NcYLwT3Zdw77s6//8XSI2NYv7WNgUONxMj+j65Qijq4/fhw==-----END PUBLIC KEY-----”
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6”
    }
  },
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/apps/6476788026/alternativeDistributionKeys”
  }
}
```

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys
{
  "data": {
    "type": "alternativeDistributionKeys",
    "id": null,
    "attributes": {
      "publicKey": "-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEFQUkD1YB67wg3e0VD/2c3N3Wf92n
uQqDgFZuYG/NcYLwT3Zdw77s6//8XSI2NYv7WNgUONxMj+j65Qijq4/fhw==
-----END PUBLIC KEY-----"
    },
    "relationships": {
      "app": {
        "data": {
          "type": "apps",
          "id": "6476788026"
        }
      }
    }
  }
}
```

**Response:**

```json
{
  "data" : {
    "type" : "alternativeDistributionKeys",
    "id" : "52c5cb04-1163-4a30-ad4f-a3433cd6a4f6",
    "attributes" : {
      "publicKey" : "-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEFQUkD1YB67wg3e0VD/2c3N3Wf92n
uQqDgFZuYG/NcYLwT3Zdw77s6//8XSI2NYv7WNgUONxMj+j65Qijq4/fhw==
-----END PUBLIC KEY-----"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/apps/6476788026/alternativeDistributionKeys"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)