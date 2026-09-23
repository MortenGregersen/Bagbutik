<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackages-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-alternativeDistributionPackages-{}"
  },
  "title" : "Read Alternative Distribution Package Information"
}
-->

# Read Alternative Distribution Package Information

Get information about a specific alternative distribution package.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/c925443b-7dfb-4cc5-8b1a-0074eb7d5fe9
```

**Response:**

```json
{
  "data" : {
    "type" : "alternativeDistributionPackages",
    "id" : "c925443b-7dfb-4cc5-8b1a-0074eb7d5fe9",
    "relationships" : {
      "versions" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/c925443b-7dfb-4cc5-8b1a-0074eb7d5fe9/relationships/versions",
          "related" : "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/c925443b-7dfb-4cc5-8b1a-0074eb7d5fe9/versions"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/c925443b-7dfb-4cc5-8b1a-0074eb7d5fe9"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/c925443b-7dfb-4cc5-8b1a-0074eb7d5fe9"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)