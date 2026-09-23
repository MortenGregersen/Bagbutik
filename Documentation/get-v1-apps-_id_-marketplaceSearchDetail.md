<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-marketplaceSearchDetail",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-marketplaceSearchDetail"
  },
  "title" : "Read the marketplace search detail url"
}
-->

# Read the marketplace search detail url

Get search detail URL for the alternative marketplace.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6476788026/marketplaceSearchDetail
```

**Response:**

```json
{
  "data" : {
    "type" : "marketplaceSearchDetails",
    "id" : "cfcfc44f-8291-4b75-84f0-4d9a55e8b878",
    "attributes" : {
      "catalogUrl" : "https://example.com/crawler-site/sitemap.xml"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/marketplaceSearchDetails/cfcfc44f-8291-4b75-84f0-4d9a55e8b878"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/apps/6476788026/marketplaceSearchDetail"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)