<!--
{
  "availability" : [
    "App Store Connect API: 3.4.1 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-alternativeDistributionDomains",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-alternativeDistributionDomains"
  },
  "title" : "Add an Alternative Distribution Domain"
}
-->

# Add an Alternative Distribution Domain

Add an alternative distribution domain to your account.

## Discussion

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/alternativeDistributionDomains
```

**Response:**

```json
{
  “data” : {
    “type” : “alternativeDistributionDomains”,
    “id” : “5b74f5e8-1d7d-48a6-afd3-9441f9027292”,
    “attributes” : {
      “domain” : “example.com”,
      “referenceName” : “exampleREF”,
      “createdDate” : “2024-03-24T07:50:59Z”
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/alternativeDistributionDomains/f6450d6a-25c7-419d-becb-4d5869b114d1”
    }
  },
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/alternativeDistributionDomains”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)