<!--
{
  "availability" : [
    "App Store Connect API: 1.7.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appCustomProductPageLocalizations-{}"
  },
  "title" : "Read Custom Product Page Localization Information"
}
-->

# Read Custom Product Page Localization Information

Get information about a specific app custom product page localization.

## Discussion

### Example Request and Response

**Other:**

```not specified
https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd
```

**Other:**

```json
{
  "data": {
    "type": "appCustomProductPageLocalizations",
    "id": "dad51248-3c38-4f19-a814-3c4f6da719dd",
    "attributes": {
      "locale": "en-US",
      "promotionalText": "This app will inspire!"
    },
    "relationships": {
      "appScreenshotSets": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd/relationships/appScreenshotSets",
          "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd/appScreenshotSets"
        }
      },
      "appPreviewSets": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd/relationships/appPreviewSets",
          "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd/appPreviewSets"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd"
  }
}
```

## See Also

[`Create a Custom Product Page Localization`](/documentation/AppStoreConnectAPI/POST-v1-appCustomProductPageLocalizations)

Add a localization for your app custom product page.

[`Modify Custom Product Page Localization Information`](/documentation/AppStoreConnectAPI/PATCH-v1-appCustomProductPageLocalizations-_id_)

Update the promotional text for an app custom product page localization.

[`List Custom Product Pages Localizations`](/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageVersions-_id_-appCustomProductPageLocalizations)

List all localizations for an app custom product page.

[`List App Preview Sets for a Custom Product Page Localization`](/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-appPreviewSets)

List the app preview sets for a specific custom product page localization.

[`List App Screenshot Sets for a Custom Product Page Localization`](/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-appScreenshotSets)

List the app screenshot sets for a specific custom product page localization.

[`List app preview set IDs for a custom product page localization`](/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-relationships-appPreviewSets)

List the app preview set IDs for a specific custom product page localization.

[`List app screenshot sets IDs for a custom product page localization`](/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-relationships-appScreenshotSets)

List the app screenshot set IDs for a specific custom product page localization.

[`Delete an App Custom Product Page Localization`](/documentation/AppStoreConnectAPI/DELETE-v1-appCustomProductPageLocalizations-_id_)

Delete localized metadata that you configured for a custom product page.



---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)