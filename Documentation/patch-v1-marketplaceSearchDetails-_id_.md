<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v1-marketplaceSearchDetails-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v1-marketplaceSearchDetails-{}"
  },
  "title" : "Modify a marketplace search detail url"
}
-->

# Modify a marketplace search detail url

Update the search detail URL for the alternative marketplace.

## Discussion

### Example Request and Response

**Request:**

```
PATCH https://api.appstoreconnect.apple.com/v1/marketplaceSearchDetails/cfcfc44f-8291-4b75-84f0-4d9a55e8b878
{
  "data": {
    "type": "marketplaceSearchDetails",
    "id": "cfcfc44f-8291-4b75-84f0-4d9a55e8b878",
    "attributes": {
      "catalogUrl": "https://example2.com/crawler-site/sitemap.xml"
    }
  }
}
```

**Response:**

```json
{
  "data": {
    "type": "marketplaceSearchDetails",
    "id": "cfcfc44f-8291-4b75-84f0-4d9a55e8b878",
    "attributes": {
      "catalogUrl": "https://example2.com/crawler-site/sitemap.xml"
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/marketplaceSearchDetails/cfcfc44f-8291-4b75-84f0-4d9a55e8b878"
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)