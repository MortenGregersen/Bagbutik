<!--
{
  "availability" : [
    "App Store Connect API: 1.7.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-appCustomProductPages",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-appCustomProductPages"
  },
  "title" : "Create a Custom Product Page"
}
-->

# Create a Custom Product Page

Add a custom product page for your app.

## Discussion

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/appCustomProductPages
{
  "data": {
    "type": "appCustomProductPages",
    "attributes": {
      "name": "Customer Product Page 1"
    },
    "relationships": {
      "app": {
        "data": {
          "type": "apps",
          "id": "01234"
        }
      },
      "appStoreVersionTemplate": {
        "data": {
          "type": "appStoreVersions",
          "id": "3b439e1a-5647-4734-9378-5e0b2b82ccb4"
        }
      },
      "appCustomProductPageVersions": {
        "data": [
          {
            "type": "appCustomProductPageVersions",
            "id": "${new-appCustomProductPageVersion-id}"
          }
        ]
      }
    }
  },
  "included": [
    {
      "type": "appCustomProductPageVersions",
      "id": "${new-appCustomProductPageVersion-id}",
      "relationships": {
        "appCustomProductPage": {},
        "appCustomProductPageLocalizations": {
          "data": [
            {
              "type": "appCustomProductPageLocalizations",
              "id": "${new-appCustomProductPageLocalization-id}"
            }
          ]
        }
      }
    },
    {
      "type": "appCustomProductPageLocalizations",
      "id": "${new-appCustomProductPageLocalization-id}",
      "attributes": {
        "locale": "en-US",
        "promotionalText": "This app will really excite!"
      }
    }
  ]
}
```

**Response:**

```json
{
  "data": {
    "type": "appCustomProductPages",
    "id": "eb2b3606-2fef-4aab-a54e-b2e5547c9bc3",
    "attributes": {
      "name": "Customer Product Page 1",
      "url": "https://apps.apple.com/us/app/gersey-numba/id1526908970?ppid=eb2b3606-2fef-4aab-a54e-b2e5547c9bc3",
      "visible": true
    },
    "relationships": {
      "appCustomProductPageVersions": {
        "meta": {
          "paging": {
            "total": 1,
            "limit": 10
          }
        },
        "data": [
          {
            "type": "appCustomProductPageVersions",
            "id": "c7eadc0b-48d9-48c4-bdb2-109dd94a793a"
          }
        ],
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
  "included": [
    {
      "type": "appCustomProductPageVersions",
      "id": "c7eadc0b-48d9-48c4-bdb2-109dd94a793a",
      "attributes": {
        "version": "1",
        "state": "PREPARE_FOR_SUBMISSION"
      },
      "relationships": {
        "appCustomProductPageLocalizations": {
          "meta": {
            "paging": {
              "total": 1,
              "limit": 10
            }
          },
          "data": [
            {
              "type": "appCustomProductPageLocalizations",
              "id": "1a0e5f2a-938a-400d-935c-7bb7c6b3476a"
            }
          ],
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageVersions/c7eadc0b-48d9-48c4-bdb2-109dd94a793a/relationships/appCustomProductPageLocalizations",
            "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageVersions/c7eadc0b-48d9-48c4-bdb2-109dd94a793a/appCustomProductPageLocalizations"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageVersions/c7eadc0b-48d9-48c4-bdb2-109dd94a793a"
      }
    },
    {
      "type": "appCustomProductPageLocalizations",
      "id": "1a0e5f2a-938a-400d-935c-7bb7c6b3476a",
      "attributes": {
        "locale": "en-US",
        "promotionalText": "This app will really excite!"
      },
      "relationships": {
        "appScreenshotSets": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/1a0e5f2a-938a-400d-935c-7bb7c6b3476a/relationships/appScreenshotSets",
            "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/1a0e5f2a-938a-400d-935c-7bb7c6b3476a/appScreenshotSets"
          }
        },
        "appPreviewSets": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/1a0e5f2a-938a-400d-935c-7bb7c6b3476a/relationships/appPreviewSets",
            "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/1a0e5f2a-938a-400d-935c-7bb7c6b3476a/appPreviewSets"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/1a0e5f2a-938a-400d-935c-7bb7c6b3476a"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)