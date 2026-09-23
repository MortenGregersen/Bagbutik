<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciMacOsVersions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciMacOsVersions"
  },
  "title" : "List all macos versions available in xcode cloud"
}
-->

# List all macos versions available in xcode cloud

List all macOS versions available to Xcode Cloud workflows.

## Discussion

The example request below lists macOS versions available to Xcode Cloud workflows. Use the information provided in the response to read additional data; for example, Xcode version information.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciMacOsVersions
```

**Response:**

```json
{
    "data": [
        {
            "type": "ciMacOsVersions",
            "id": "20G95",
            "attributes": {
                "version": "20G95",
                "name": "macOS Big Sur 11.5.2 (20G95)"
            },
            "relationships": {
                "xcodeVersions": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciMacOsVersions/20G95/relationships/xcodeVersions",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciMacOsVersions/20G95/xcodeVersions"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciMacOsVersions/20G95"
            }
        }
    ],
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciMacOsVersions"
    },
    "meta": {
        "paging": {
            "total": 1,
            "limit": 50
        }
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)