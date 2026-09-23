<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-alternativeDistributionPackages",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-alternativeDistributionPackages"
  },
  "title" : "Create an Alternative Distribution Package"
}
-->

# Create an Alternative Distribution Package

Create an alternative distribution package for an App Store version.

## Discussion

> Tip:
> This endpoint requires the `appStoreVersion` in the payload. Obtain the `appStoreVersion` resource ID from the ``doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appStoreVersions`` response.

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages
{
  "data": {
    "type": "alternativeDistributionPackages",
    "relationships": {
      "appStoreVersion": {
        "data": {
          "type": "appStoreVersions",
          "id": "3fb74833-4bf4-4c34-9cfd-f9dc4978ea45"
        }
      }
    }
  }
}
```

**Response:**

```json
{
  "data": {
    "type": "alternativeDistributionPackages",
    "id": "f3190601-974c-45ee-aa24-35db2090c260",
    "relationships": {
      "versions": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/f3190601-974c-45ee-aa24-35db2090c260/relationships/versions",
          "related": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/f3190601-974c-45ee-aa24-35db2090c260/versions"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/f3190601-974c-45ee-aa24-35db2090c260"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)