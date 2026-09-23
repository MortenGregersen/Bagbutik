<!--
{
  "availability" : [
    "App Store Connect API: 1.7.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v1-appCustomProductPageLocalizations-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v1-appCustomProductPageLocalizations-{}"
  },
  "title" : "Modify Custom Product Page Localization Information"
}
-->

# Modify Custom Product Page Localization Information

Update the promotional text for an app custom product page localization.

## Discussion

### Example Request and Response

**Request:**

```
PATCH https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c
{
    "data": {
        "id": "736966e2-178b-4e3f-bfb9-474eb19fbd8c",
        "type": "appCustomProductPageLocalizations",
        "attributes": {
            "promotionalText": "Ogenblik!"
        }
    }
}
```

**Response:**

```json
{
  "data": {
    "type": "appCustomProductPageLocalizations",
    "id": "736966e2-178b-4e3f-bfb9-474eb19fbd8c",
    "attributes": {
      "locale": "nl-NL",
      "promotionalText": "Ogenblik!"
    },
    "relationships": {
      "appScreenshotSets": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c/relationships/appScreenshotSets",
          "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c/appScreenshotSets"
        }
      },
      "appPreviewSets": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c/relationships/appPreviewSets",
          "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c/appPreviewSets"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)