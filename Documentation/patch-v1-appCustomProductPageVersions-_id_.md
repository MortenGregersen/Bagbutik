<!--
{
  "availability" : [
    "App Store Connect API: 3.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v1-appCustomProductPageVersions-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v1-appCustomProductPageVersions-{}"
  },
  "title" : "Modify a Custom Product Page Version"
}
-->

# Modify a Custom Product Page Version

Update the name and visibility status of an app custom product page.

## Discussion

### Example Request and Response

**Request:**

```
PATCH https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2
{
    "data": {
        "type": "appCustomProductPageVersions",
        "id": "372e5398-047b-4793-951b-2935d8578ab2",
        "attributes": {
            "deepLink": "https://example.com/deeplink"
        }
    }
}
```

**Response:**

```json
{
  "data" : {
    "type" : "appCustomProductPageVersions",
    "id" : "372e5398-047b-4793-951b-2935d8578ab2",
    "attributes" : {
      "version" : "3",
      "state" : "PREPARE_FOR_SUBMISSION",
      "deepLink" : "https://example.com/deeplink"
    },
    "relationships" : {
      "appCustomProductPageLocalizations" : {
        "links" : {
          "self" : "https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2/relationships/appCustomProductPageLocalizations",
          "related" : "https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2/appCustomProductPageLocalizations"
        }
      }
    },
    "links" : {
      "self" : "https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2"
    }
  },
  "links" : {
    "self" : "https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)