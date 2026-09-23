<!--
{
  "availability" : [
    "App Store Connect API: 1.7.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-appScreenshotSets",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appCustomProductPageLocalizations-{}-appScreenshotSets"
  },
  "title" : "List App Screenshot Sets for a Custom Product Page Localization"
}
-->

# List App Screenshot Sets for a Custom Product Page Localization

List the app screenshot sets for a specific custom product page localization.

## Discussion

### Example Request and Response

**Other:**

```not specified
https://api.appstoreconnect.apple.com/v1/appCustomProductPageVersions/e0e9216a-338c-4616-9fd5-0ec6c14c6950/appCustomProductPageLocalizations
```

**Other:**

```json
{
  "data": [
    {
      "type": "appScreenshotSets",
      "id": "3d87ecbb-bcdc-4c2f-b34f-ced3cf666de7",
      "attributes": {
        "screenshotDisplayType": "APP_IPHONE_65"
      },
      "relationships": {
        "appScreenshots": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/3d87ecbb-bcdc-4c2f-b34f-ced3cf666de7/relationships/appScreenshots",
            "related": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/3d87ecbb-bcdc-4c2f-b34f-ced3cf666de7/appScreenshots"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/3d87ecbb-bcdc-4c2f-b34f-ced3cf666de7"
      }
    },
    {
      "type": "appScreenshotSets",
      "id": "a59be7c9-8f97-45cc-939d-09c101c483e3",
      "attributes": {
        "screenshotDisplayType": "APP_IPHONE_55"
      },
      "relationships": {
        "appScreenshots": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/a59be7c9-8f97-45cc-939d-09c101c483e3/relationships/appScreenshots",
            "related": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/a59be7c9-8f97-45cc-939d-09c101c483e3/appScreenshots"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/a59be7c9-8f97-45cc-939d-09c101c483e3"
      }
    },
    {
      "type": "appScreenshotSets",
      "id": "69a9c45d-4508-4b4a-a08e-03e0bc018903",
      "attributes": {
        "screenshotDisplayType": "APP_IPAD_PRO_3GEN_129"
      },
      "relationships": {
        "appScreenshots": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/69a9c45d-4508-4b4a-a08e-03e0bc018903/relationships/appScreenshots",
            "related": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/69a9c45d-4508-4b4a-a08e-03e0bc018903/appScreenshots"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/69a9c45d-4508-4b4a-a08e-03e0bc018903"
      }
    },
    {
      "type": "appScreenshotSets",
      "id": "51bc2274-7517-4e56-82e4-c80f6014d44a",
      "attributes": {
        "screenshotDisplayType": "APP_IPAD_PRO_129"
      },
      "relationships": {
        "appScreenshots": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/51bc2274-7517-4e56-82e4-c80f6014d44a/relationships/appScreenshots",
            "related": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/51bc2274-7517-4e56-82e4-c80f6014d44a/appScreenshots"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/51bc2274-7517-4e56-82e4-c80f6014d44a"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/0d95bf9e-8256-4abf-83e2-9b428919100f/appScreenshotSets"
  },
  "meta": {
    "paging": {
      "total": 4,
      "limit": 50
    }
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

[`Read Custom Product Page Localization Information`](/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_)

Get information about a specific app custom product page localization.

[`List App Preview Sets for a Custom Product Page Localization`](/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-appPreviewSets)

List the app preview sets for a specific custom product page localization.

[`List app preview set IDs for a custom product page localization`](/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-relationships-appPreviewSets)

List the app preview set IDs for a specific custom product page localization.

[`List app screenshot sets IDs for a custom product page localization`](/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-relationships-appScreenshotSets)

List the app screenshot set IDs for a specific custom product page localization.

[`Delete an App Custom Product Page Localization`](/documentation/AppStoreConnectAPI/DELETE-v1-appCustomProductPageLocalizations-_id_)

Delete localized metadata that you configured for a custom product page.



---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)