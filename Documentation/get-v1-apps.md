<!--
{
  "availability" : [
    "App Store Connect API: 1.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps"
  },
  "title" : "List apps"
}
-->

# List apps

Find and list apps in App Store Connect.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps?limit=2
```

**Response:**

```json
{
  "data": [
    {
      "type": "apps",
      "id": "10746822401",
      "attributes": {
        "name": "Your Next Cortado",
        "bundleId": "com.bdt.ync",
        "sku": "YNC",
        "primaryLocale": "en-US",
        "isOrEverWasMadeForKids": false,
        "subscriptionStatusUrl": null,
        "subscriptionStatusUrlVersion": null,
        "subscriptionStatusUrlForSandbox": null,
        "subscriptionStatusUrlVersionForSandbox": null,
        "contentRightsDeclaration": "DOES_NOT_USE_THIRD_PARTY_CONTENT",
        "streamlinedBuyEnabled": false
      },
      "relationships": {
        "appEncryptionDeclarations": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appEncryptionDeclarations",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appEncryptionDeclarations"
          }
        },
        "ciProduct": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/ciProduct",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/ciProduct"
          }
        },
        "betaTesters": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/betaTesters"
          }
        },
        "betaGroups": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/betaGroups",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/betaGroups"
          }
        },
        "appStoreVersions": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appStoreVersions",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appStoreVersions"
          }
        },
        "preReleaseVersions": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/preReleaseVersions",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/preReleaseVersions"
          }
        },
        "betaAppLocalizations": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/betaAppLocalizations",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/betaAppLocalizations"
          }
        },
        "builds": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/builds",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/builds"
          }
        },
        "betaLicenseAgreement": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/betaLicenseAgreement",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/betaLicenseAgreement"
          }
        },
        "betaAppReviewDetail": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/betaAppReviewDetail",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/betaAppReviewDetail"
          }
        },
        "appInfos": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appInfos",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appInfos"
          }
        },
        "appClips": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appClips",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appClips"
          }
        },
        "appPricePoints": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appPricePoints",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appPricePoints"
          }
        },
        "endUserLicenseAgreement": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/endUserLicenseAgreement",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/endUserLicenseAgreement"
          }
        },
        "preOrder": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/preOrder",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/preOrder"
          }
        },
        "appPriceSchedule": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appPriceSchedule",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appPriceSchedule"
          }
        },
        "appAvailability": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appAvailability",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appAvailability"
          }
        },
        "appAvailabilityV2": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appAvailabilityV2",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appAvailabilityV2"
          }
        },
        "inAppPurchases": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/inAppPurchases",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/inAppPurchases"
          }
        },
        "subscriptionGroups": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/subscriptionGroups",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/subscriptionGroups"
          }
        },
        "gameCenterEnabledVersions": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/gameCenterEnabledVersions",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/gameCenterEnabledVersions"
          }
        },
        "perfPowerMetrics": {
          "links": {
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/perfPowerMetrics"
          }
        },
        "appCustomProductPages": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appCustomProductPages",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appCustomProductPages"
          }
        },
        "inAppPurchasesV2": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/inAppPurchasesV2",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/inAppPurchasesV2"
          }
        },
        "promotedPurchases": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/promotedPurchases",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/promotedPurchases"
          }
        },
        "appEvents": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appEvents",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appEvents"
          }
        },
        "reviewSubmissions": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/reviewSubmissions",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/reviewSubmissions"
          }
        },
        "subscriptionGracePeriod": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/subscriptionGracePeriod",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/subscriptionGracePeriod"
          }
        },
        "customerReviews": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/customerReviews",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/customerReviews"
          }
        },
        "gameCenterDetail": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/gameCenterDetail",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/gameCenterDetail"
          }
        },
        "appStoreVersionExperimentsV2": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/appStoreVersionExperimentsV2",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/appStoreVersionExperimentsV2"
          }
        },
        "alternativeDistributionKey": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/alternativeDistributionKey",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/alternativeDistributionKey"
          }
        },
        "analyticsReportRequests": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/analyticsReportRequests",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/analyticsReportRequests"
          }
        },
        "marketplaceSearchDetail": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/relationships/marketplaceSearchDetail",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746822401/marketplaceSearchDetail"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/apps/10746822401"
      }
    },
    {
      "type": "apps",
      "id": "10746821976",
      "attributes": {
        "name": "A Lot of Latte",
        "bundleId": "com.bdt.latte",
        "sku": "alotoflatte",
        "primaryLocale": "en-US",
        "isOrEverWasMadeForKids": false,
        "subscriptionStatusUrl": null,
        "subscriptionStatusUrlVersion": null,
        "subscriptionStatusUrlForSandbox": null,
        "subscriptionStatusUrlVersionForSandbox": null,
        "contentRightsDeclaration": "DOES_NOT_USE_THIRD_PARTY_CONTENT",
        "streamlinedBuyEnabled": false
      },
      "relationships": {
        "appEncryptionDeclarations": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appEncryptionDeclarations",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appEncryptionDeclarations"
          }
        },
        "ciProduct": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/ciProduct",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/ciProduct"
          }
        },
        "betaTesters": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/betaTesters"
          }
        },
        "betaGroups": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/betaGroups",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/betaGroups"
          }
        },
        "appStoreVersions": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appStoreVersions",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appStoreVersions"
          }
        },
        "preReleaseVersions": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/preReleaseVersions",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/preReleaseVersions"
          }
        },
        "betaAppLocalizations": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/betaAppLocalizations",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/betaAppLocalizations"
          }
        },
        "builds": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/builds",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/builds"
          }
        },
        "betaLicenseAgreement": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/betaLicenseAgreement",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/betaLicenseAgreement"
          }
        },
        "betaAppReviewDetail": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/betaAppReviewDetail",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/betaAppReviewDetail"
          }
        },
        "appInfos": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appInfos",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appInfos"
          }
        },
        "appClips": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appClips",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appClips"
          }
        },
        "appPricePoints": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appPricePoints",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appPricePoints"
          }
        },
        "endUserLicenseAgreement": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/endUserLicenseAgreement",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/endUserLicenseAgreement"
          }
        },
        "preOrder": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/preOrder",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/preOrder"
          }
        },
        "appPriceSchedule": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appPriceSchedule",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appPriceSchedule"
          }
        },
        "appAvailability": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appAvailability",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appAvailability"
          }
        },
        "appAvailabilityV2": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appAvailabilityV2",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appAvailabilityV2"
          }
        },
        "inAppPurchases": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/inAppPurchases",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/inAppPurchases"
          }
        },
        "subscriptionGroups": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/subscriptionGroups",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/subscriptionGroups"
          }
        },
        "gameCenterEnabledVersions": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/gameCenterEnabledVersions",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/gameCenterEnabledVersions"
          }
        },
        "perfPowerMetrics": {
          "links": {
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/perfPowerMetrics"
          }
        },
        "appCustomProductPages": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appCustomProductPages",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appCustomProductPages"
          }
        },
        "inAppPurchasesV2": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/inAppPurchasesV2",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/inAppPurchasesV2"
          }
        },
        "promotedPurchases": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/promotedPurchases",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/promotedPurchases"
          }
        },
        "appEvents": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appEvents",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appEvents"
          }
        },
        "reviewSubmissions": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/reviewSubmissions",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/reviewSubmissions"
          }
        },
        "subscriptionGracePeriod": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/subscriptionGracePeriod",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/subscriptionGracePeriod"
          }
        },
        "customerReviews": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/customerReviews",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/customerReviews"
          }
        },
        "gameCenterDetail": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/gameCenterDetail",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/gameCenterDetail"
          }
        },
        "appStoreVersionExperimentsV2": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/appStoreVersionExperimentsV2",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/appStoreVersionExperimentsV2"
          }
        },
        "alternativeDistributionKey": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/alternativeDistributionKey",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/alternativeDistributionKey"
          }
        },
        "analyticsReportRequests": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/analyticsReportRequests",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/analyticsReportRequests"
          }
        },
        "marketplaceSearchDetail": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/relationships/marketplaceSearchDetail",
            "related": "https://api.appstoreconnect.apple.com/v1/apps/10746821976/marketplaceSearchDetail"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/apps/10746821976"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/apps?limit=2",
    "next": "https://api.appstoreconnect.apple.com/v1/apps?cursor=AoJ4g7mg6o4DKzEwNzQ2ODIxOTc2.ANrJC88&limit=2"
  },
  "meta": {
    "paging": {
      "total": 431,
      "limit": 2
    }
  }
}
```

## See Also

[`Read app information`](/documentation/AppStoreConnectAPI/GET-v1-apps-_id_)

Get information about a specific app.

[`Modify an app`](/documentation/AppStoreConnectAPI/PATCH-v1-apps-_id_)

Update app information, including bundle ID, primary locale, price schedule, and global availability.

[`Read an app’s encryption declarations`](/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appEncryptionDeclarations)

Find and list all available app encryption declarations.

[`Read an app’s encryption declaration ids`](/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-relationships-appEncryptionDeclarations)

Find and list all available app encryption declaration IDs for a specific app.



---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)