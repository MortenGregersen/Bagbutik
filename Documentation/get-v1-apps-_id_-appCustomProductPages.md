<!--
{
  "availability" : [
    "App Store Connect API: 1.7.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appCustomProductPages",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-appCustomProductPages"
  },
  "title" : "List All Custom Product Pages for an App"
}
-->

# List All Custom Product Pages for an App

Get a list of all custom product pages for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/01234/appCustomProductPages
```

**Response:**

```json
{
  "data": [
    {
      "type": "appCustomProductPages",
      "id": "eb2b3606-2fef-4aab-a54e-b2e5547c9bc3",
      "attributes": {
        "name": "Custom Product Page May 1",
        "url": "https://apps.apple.com/us/app/name/id01234?ppid=eb2b3606-2fef-4aab-a54e-b2e5547c9bc3",
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
    {
      "type": "appCustomProductPages",
      "id": "2a92bd8e-e59a-4b6e-bca0-04209c16fc7e",
      "attributes": {
        "name": "Customer Product Page 1",
        "url": "https://apps.apple.com/us/app/gersey-numba/id1526908970?ppid=2a92bd8e-e59a-4b6e-bca0-04209c16fc7e",
        "visible": true
      },
      "relationships": {
        "appCustomProductPageVersions": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/2a92bd8e-e59a-4b6e-bca0-04209c16fc7e/relationships/appCustomProductPageVersions",
            "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/2a92bd8e-e59a-4b6e-bca0-04209c16fc7e/appCustomProductPageVersions"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/2a92bd8e-e59a-4b6e-bca0-04209c16fc7e"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/apps/01234/appCustomProductPages"
  },
  "meta": {
    "paging": {
      "total": 2,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)