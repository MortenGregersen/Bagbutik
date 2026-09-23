<!--
{
  "availability" : [
    "App Store Connect API: 1.7.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPages-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appCustomProductPages-{}"
  },
  "title" : "Read Custom Product Page Information"
}
-->

# Read Custom Product Page Information

Get information about a specific app custom product page.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3
```

**Response:**

```json
{
  "data": {
    "type": "appCustomProductPages",
    "id": "eb2b3606-2fef-4aab-a54e-b2e5547c9bc3",
    "attributes": {
      "name": "Custom Product Page May 1",
      "url": "https://apps.apple.com/us/app/gersey-numba/id1526908970?ppid=eb2b3606-2fef-4aab-a54e-b2e5547c9bc3",
      "visible": false
    },
    "relationships": {
      "appCustomProductPageVersions": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3/relationships/appCustomProductPageVersions",
          "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3/appCustomProductPageVersions"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)