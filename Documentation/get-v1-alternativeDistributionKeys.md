<!--
{
  "availability" : [
    "App Store Connect API: 3.4.2 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionKeys",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-alternativeDistributionKeys"
  },
  "title" : "List Alternative Distribution Keys"
}
-->

# List Alternative Distribution Keys

List the alternative distribution key for your account.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys
```

**Response:**

```json
{
  "data": [
    {
      "type": "alternativeDistributionKeys",
      "id": "050614c7-6d00-4db1-98e6-5869c8281f30",
      "attributes": {
        "publicKey": "-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEskEtS7l4Bl4321ZcP0V7H7rHnmncHAiUWSFK/Hz4bzhd1ZyPYRwRv6zeuH+CiVmFrggScHVrBO0UUz+gRN73kQ==-----END PUBLIC KEY-----"
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/050614c7-6d00-1234-98e6-5869c8281f30"
      }
    },
    {
      "type": "alternativeDistributionKeys",
      "id": "739970a0-9c7e-4fd1-be2c-f13204c728b7",
      "attributes": {
        "publicKey": "-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEZfD+k4321CZCu2tEx0SMsyhInL2G4lRBlF1ZDNnKBV7MPHFlDIQd92S2h37w46qrqVEivpSSWnFKVks+ZBeE5w==-----END PUBLIC KEY-----"
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/739970a0-9c7e-2222-be2c-f13204c728b7"
      }
    },
    {
      "type": "alternativeDistributionKeys",
      "id": "ac79daa8-f11c-4c38-b244-4c7a464dbf82",
      "attributes": {
        "publicKey": "-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE38Gko2k5454321/+bSb/rMd2BRU0RZoHKRMm214cqeickeWFVpOQMHXOvOuhS+i3pX7fiVGvMthanQP2KIwiZQ==-----END PUBLIC KEY-----"
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/ac79daa8-f11c-ffff-b244-4c7a464dbf82"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys"
  },
  "meta": {
    "paging": {
      "total": 3,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)