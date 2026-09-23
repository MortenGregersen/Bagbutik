<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appStoreVersions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-appStoreVersions"
  },
  "title" : "List all app store versions for an app"
}
-->

# List all app store versions for an app

Get a list of all App Store versions of an app across all platforms.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6446998023/appStoreVersions
```

**Response:**

```json
{
  "data": [
    {
      "type": "appStoreVersions",
      "id": "2395b439-fccd-4645-95bc-97afbe9e379e",
      "attributes": {
        "platform": "IOS",
        "versionString": "1.0",
        "appStoreState": "PREPARE_FOR_SUBMISSION",
        "copyright": "2022 YNC",
        "releaseType": "MANUAL",
        "earliestReleaseDate": null,
        "usesIdfa": null,
        "downloadable": true,
        "createdDate": "2022-08-31T09:28:28-07:00"
      },
      "relationships": {
        "appStoreVersionLocalizations": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/appStoreVersionLocalizations",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/appStoreVersionLocalizations"
          }
        },
        "build": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/build",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/build"
          }
        },
        "appStoreVersionPhasedRelease": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/appStoreVersionPhasedRelease",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/appStoreVersionPhasedRelease"
          }
        },
        "routingAppCoverage": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/routingAppCoverage",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/routingAppCoverage"
          }
        },
        "appStoreReviewDetail": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/appStoreReviewDetail",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/appStoreReviewDetail"
          }
        },
        "appStoreVersionSubmission": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/appStoreVersionSubmission",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/appStoreVersionSubmission"
          }
        },
        "idfaDeclaration": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/idfaDeclaration",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/idfaDeclaration"
          }
        },
        "appClipDefaultExperience": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/appClipDefaultExperience",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/appClipDefaultExperience"
          }
        },
        "appStoreVersionExperiments": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/appStoreVersionExperiments",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/appStoreVersionExperiments"
          }
        },
        "customerReviews": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/relationships/customerReviews",
            "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e/customerReviews"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/2395b439-fccd-4645-95bc-97afbe9e379e"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/appStoreVersions"
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