import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an app

     Update app information, including bundle ID, primary locale, price schedule, and global availability.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6446998023 -d
     "{
       "data": {
         "type": "apps",
         "id": "6446998023",
         "attributes": {
           "availableInNewTerritories": true,
           "contentRightsDeclaration": "DOES_NOT_USE_THIRD_PARTY_CONTENT"
         }
       }
     }
     "
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "apps",
         "id": "6446998023",
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
           "availableInNewTerritories": true,
           "contentRightsDeclaration": "DOES_NOT_USE_THIRD_PARTY_CONTENT"
         },
         "relationships": {
           "ciProduct": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/ciProduct",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/ciProduct"
             }
           },
           "betaTesters": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/betaTesters"
             }
           },
           "betaGroups": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/betaGroups",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaGroups"
             }
           },
           "appStoreVersions": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/appStoreVersions",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/appStoreVersions"
             }
           },
           "preReleaseVersions": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/preReleaseVersions",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/preReleaseVersions"
             }
           },
           "betaAppLocalizations": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/betaAppLocalizations",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaAppLocalizations"
             }
           },
           "builds": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/builds",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/builds"
             }
           },
           "betaLicenseAgreement": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/betaLicenseAgreement",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaLicenseAgreement"
             }
           },
           "betaAppReviewDetail": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/betaAppReviewDetail",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaAppReviewDetail"
             }
           },
           "appInfos": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/appInfos",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/appInfos"
             }
           },
           "appClips": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/appClips",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/appClips"
             }
           },
           "appPricePoints": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/appPricePoints",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/appPricePoints"
             }
           },
           "pricePoints": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/pricePoints",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/pricePoints"
             }
           },
           "endUserLicenseAgreement": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/endUserLicenseAgreement",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/endUserLicenseAgreement"
             }
           },
           "preOrder": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/preOrder",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/preOrder"
             }
           },
           "prices": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/prices",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/prices"
             }
           },
           "appPriceSchedule": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/appPriceSchedule",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/appPriceSchedule"
             }
           },
           "availableTerritories": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/availableTerritories",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/availableTerritories"
             }
           },
           "appAvailability": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/appAvailability",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/appAvailability"
             }
           },
           "inAppPurchases": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/inAppPurchases",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/inAppPurchases"
             }
           },
           "subscriptionGroups": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/subscriptionGroups",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/subscriptionGroups"
             }
           },
           "gameCenterEnabledVersions": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/gameCenterEnabledVersions",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/gameCenterEnabledVersions"
             }
           },
           "perfPowerMetrics": {
             "links": {
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/perfPowerMetrics"
             }
           },
           "appCustomProductPages": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/appCustomProductPages",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/appCustomProductPages"
             }
           },
           "inAppPurchasesV2": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/inAppPurchasesV2",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/inAppPurchasesV2"
             }
           },
           "promotedPurchases": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/promotedPurchases",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/promotedPurchases"
             }
           },
           "appEvents": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/appEvents",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/appEvents"
             }
           },
           "reviewSubmissions": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/reviewSubmissions",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/reviewSubmissions"
             }
           },
           "subscriptionGracePeriod": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/subscriptionGracePeriod",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/subscriptionGracePeriod"
             }
           },
           "customerReviews": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/relationships/customerReviews",
               "related": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/customerReviews"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-apps-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: App representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppV1(id: String,
                            requestBody: AppUpdateRequest) -> Request<AppResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
