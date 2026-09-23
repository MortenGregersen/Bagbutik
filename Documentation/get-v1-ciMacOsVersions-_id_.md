<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciMacOsVersions-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciMacOsVersions-{}"
  },
  "title" : "Read macos version information"
}
-->

# Read macos version information

Get information about a specific macOS version that’s available to Xcode Cloud workflows.

## Discussion

The example request below accesses information about a macOS version available to Xcode Cloud workflows. Use the data provided in the response to read additional information; for example, Xcode versions.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciMacOsVersions/20G95
```

**Response:**

```json
{
    "data": {
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
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciMacOsVersions/20G95"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)