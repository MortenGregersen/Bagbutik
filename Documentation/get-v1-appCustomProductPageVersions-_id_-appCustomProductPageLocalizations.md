<!--
{
  "availability" : [
    "App Store Connect API: 1.7.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageVersions-_id_-appCustomProductPageLocalizations",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appCustomProductPageVersions-{}-appCustomProductPageLocalizations"
  },
  "title" : "List Custom Product Pages Localizations"
}
-->

# List Custom Product Pages Localizations

List all localizations for an app custom product page.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appCustomProductPageVersions/6c0df710-d69a-454f-be7c-f5b014788dee/appCustomProductPageLocalizations
```

**Response:**

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
}a{
  "data": [
    {
      "type": "appCustomProductPageLocalizations",
      "id": "77cefe66-a51a-4d4d-a5bd-cc40a733def0",
      "attributes": {
        "locale": "en-CA",
        "promotionalText": "This app will bring you inspiration."
      },
      "relationships": {
        "appScreenshotSets": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/77cefe66-a51a-4d4d-a5bd-cc40a733def0/relationships/appScreenshotSets",
            "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/77cefe66-a51a-4d4d-a5bd-cc40a733def0/appScreenshotSets"
          }
        },
        "appPreviewSets": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/77cefe66-a51a-4d4d-a5bd-cc40a733def0/relationships/appPreviewSets",
            "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/77cefe66-a51a-4d4d-a5bd-cc40a733def0/appPreviewSets"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/77cefe66-a51a-4d4d-a5bd-cc40a733def0"
      }
    },
    {
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
    {
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
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageVersions/6c0df710-d69a-454f-be7c-f5b014788dee/appCustomProductPageLocalizations"
  },
  "meta": {
    "paging": {
      "total": 3,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)