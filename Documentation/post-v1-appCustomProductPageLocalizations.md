<!--
{
  "availability" : [
    "App Store Connect API: 1.7.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-appCustomProductPageLocalizations",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-appCustomProductPageLocalizations"
  },
  "title" : "Create a Custom Product Page Localization"
}
-->

# Create a Custom Product Page Localization

Add a localization for your app custom product page.

## Discussion

### Example Request and Response

**Request:**

```
POST https://appstoreconnect.apple.com/v1/appCustomProductPageLocalizations
{
    "data": {
        "type": "appCustomProductPageLocalizations",
        "attributes": {
            "locale": "en-CA",
            "promotionalText": "There will be so much fun."
        },
        "relationships": {
            "appCustomProductPageVersion": {
                "data": {
                    "type": "appCustomProductPageVersions",
                    "id": "46e3a412-7248-43f8-a6bf-cf445eafa3ef"
                }
            }
        }
    }
}
```

**Response:**

```json
{
  "data" : {
    "type" : "appCustomProductPageLocalizations",
    "id" : "0ff34f9c-e2f9-4317-a3e5-44e012c2ffbc",
    "attributes" : {
      "locale" : "en-CA",
      "promotionalText" : "There will be so much fun."
    },
    "relationships" : {
      "appScreenshotSets" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/0ff34f9c-e2f9-4317-a3e5-44e012c2ffbc/relationships/appScreenshotSets",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/0ff34f9c-e2f9-4317-a3e5-44e012c2ffbc/appScreenshotSets"
        }
      },
      "appPreviewSets" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/0ff34f9c-e2f9-4317-a3e5-44e012c2ffbc/relationships/appPreviewSets",
          "related" : "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/0ff34f9c-e2f9-4317-a3e5-44e012c2ffbc/appPreviewSets"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/0ff34f9c-e2f9-4317-a3e5-44e012c2ffbc"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)