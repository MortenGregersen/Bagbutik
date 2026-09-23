import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
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

     [`Read app information`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-apps-_id_)

     Get information about a specific app.

     [`Modify an app`](https://developer.apple.com/documentation/AppStoreConnectAPI/PATCH-v1-apps-_id_)

     Update app information, including bundle ID, primary locale, price schedule, and global availability.

     [`Read an app’s encryption declarations`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appEncryptionDeclarations)

     Find and list all available app encryption declarations.

     [`Read an app’s encryption declaration ids`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-relationships-appEncryptionDeclarations)

     Find and list all available app encryption declaration IDs for a specific app.



     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter exists: Attributes, relationships, and IDs to check for existence
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppsV1(fields: [ListAppsV1.Field]? = nil,
                           filters: [ListAppsV1.Filter]? = nil,
                           exists: [ListAppsV1.Exist]? = nil,
                           includes: [ListAppsV1.Include]? = nil,
                           sorts: [ListAppsV1.Sort]? = nil,
                           limits: [ListAppsV1.Limit]? = nil) -> Request<AppsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                exists: exists,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListAppsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type androidToIosAppMappingDetails
        case androidToIosAppMappingDetails([AndroidToIosAppMappingDetails])
        /// The fields to include for returned resources of type appClips
        case appClips([AppClips])
        /// The fields to include for returned resources of type appCustomProductPages
        case appCustomProductPages([AppCustomProductPages])
        /// The fields to include for returned resources of type appEncryptionDeclarations
        case appEncryptionDeclarations([AppEncryptionDeclarations])
        /// The fields to include for returned resources of type appEvents
        case appEvents([AppEvents])
        /// The fields to include for returned resources of type appInfos
        case appInfos([AppInfos])
        /// The fields to include for returned resources of type appStoreVersionExperiments
        case appStoreVersionExperiments([AppStoreVersionExperiments])
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type betaAppLocalizations
        case betaAppLocalizations([BetaAppLocalizations])
        /// The fields to include for returned resources of type betaAppReviewDetails
        case betaAppReviewDetails([BetaAppReviewDetails])
        /// The fields to include for returned resources of type betaGroups
        case betaGroups([BetaGroups])
        /// The fields to include for returned resources of type betaLicenseAgreements
        case betaLicenseAgreements([BetaLicenseAgreements])
        /// The fields to include for returned resources of type buildIcons
        case buildIcons([BuildIcons])
        /// The fields to include for returned resources of type builds
        case builds([Builds])
        /// The fields to include for returned resources of type ciProducts
        case ciProducts([CiProducts])
        /// The fields to include for returned resources of type endUserLicenseAgreements
        case endUserLicenseAgreements([EndUserLicenseAgreements])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterEnabledVersions
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case gameCenterEnabledVersions([GameCenterEnabledVersions])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
        /// The fields to include for returned resources of type preReleaseVersions
        case preReleaseVersions([PreReleaseVersions])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])
        /// The fields to include for returned resources of type reviewSubmissions
        case reviewSubmissions([ReviewSubmissions])
        /// The fields to include for returned resources of type subscriptionGracePeriods
        case subscriptionGracePeriods([SubscriptionGracePeriods])
        /// The fields to include for returned resources of type subscriptionGroups
        case subscriptionGroups([SubscriptionGroups])

        public enum AndroidToIosAppMappingDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appSigningKeyPublicCertificateSha256Fingerprints
            case packageName

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AndroidToIosAppMappingDetails(rawValue: string) {
                    self = value
                } else if let value = AndroidToIosAppMappingDetails(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AndroidToIosAppMappingDetails value: \(string)"
                    )
                }
            }
        }

        public enum AppClips: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appClipAdvancedExperiences
            case appClipDefaultExperiences
            case bundleId

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppClips(rawValue: string) {
                    self = value
                } else if let value = AppClips(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppClips value: \(string)"
                    )
                }
            }
        }

        public enum AppCustomProductPages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appCustomProductPageVersions
            case name
            case url
            case visible

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppCustomProductPages(rawValue: string) {
                    self = value
                } else if let value = AppCustomProductPages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppCustomProductPages value: \(string)"
                    )
                }
            }
        }

        public enum AppEncryptionDeclarations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appDescription
            case appEncryptionDeclarationDocument
            case appEncryptionDeclarationState
            case availableOnFrenchStore
            case builds
            case codeValue
            case containsProprietaryCryptography
            case containsThirdPartyCryptography
            case createdDate
            case documentName
            case documentType
            case documentUrl
            case exempt
            case platform
            case uploadedDate
            case usesEncryption

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEncryptionDeclarations(rawValue: string) {
                    self = value
                } else if let value = AppEncryptionDeclarations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEncryptionDeclarations value: \(string)"
                    )
                }
            }
        }

        public enum AppEvents: String, Sendable, ParameterValue, Codable, CaseIterable {
            case archivedTerritorySchedules
            case badge
            case deepLink
            case eventState
            case localizations
            case primaryLocale
            case priority
            case purchaseRequirement
            case purpose
            case referenceName
            case territorySchedules

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEvents(rawValue: string) {
                    self = value
                } else if let value = AppEvents(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEvents value: \(string)"
                    )
                }
            }
        }

        public enum AppInfos: String, Sendable, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case app
            case appInfoLocalizations
            case appStoreAgeRating
            case appStoreState
            case australiaAgeRating
            case brazilAgeRating
            case brazilAgeRatingV2
            case franceAgeRating
            case koreaAgeRating
            case primaryCategory
            case primarySubcategoryOne
            case primarySubcategoryTwo
            case secondaryCategory
            case secondarySubcategoryOne
            case secondarySubcategoryTwo
            case state
            case territoryAgeRatings

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppInfos(rawValue: string) {
                    self = value
                } else if let value = AppInfos(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppInfos value: \(string)"
                    )
                }
            }
        }

        public enum AppStoreVersionExperiments: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionExperimentTreatments
            case controlVersions
            case endDate
            case latestControlVersion
            case name
            case platform
            case reviewRequired
            case startDate
            case state
            case trafficProportion

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreVersionExperiments(rawValue: string) {
                    self = value
                } else if let value = AppStoreVersionExperiments(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreVersionExperiments value: \(string)"
                    )
                }
            }
        }

        public enum AppStoreVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionPackage
            case app
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionExperimentsV2
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case appVersionState
            case build
            case copyright
            case createdDate
            case customerReviews
            case downloadable
            case earliestReleaseDate
            case gameCenterAppVersion
            case platform
            case releaseType
            case reviewType
            case routingAppCoverage
            case usesIdfa
            case versionString

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreVersions(rawValue: string) {
                    self = value
                } else if let value = AppStoreVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreVersions value: \(string)"
                    )
                }
            }
        }

        public enum Apps: String, Sendable, ParameterValue, Codable, CaseIterable {
            case accessibilityDeclarations
            case accessibilityUrl
            case alternativeDistributionKey
            case analyticsReportRequests
            case androidToIosAppMappingDetails
            case appAvailabilityV2
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreIcon
            case appStoreVersionExperimentsV2
            case appStoreVersions
            case appTags
            case backgroundAssets
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaFeedbackCrashSubmissions
            case betaFeedbackScreenshotSubmissions
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case buildUploads
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
            case customerReviewSummarizations
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterDetail
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case marketplaceSearchDetail
            case name
            case perfPowerMetrics
            case performanceOverviews
            case preReleaseVersions
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case searchKeywords
            case sku
            case streamlinedPurchasingEnabled
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
            case webhooks

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Apps(rawValue: string) {
                    self = value
                } else if let value = Apps(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Apps value: \(string)"
                    )
                }
            }
        }

        public enum BetaAppLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case description
            case feedbackEmail
            case locale
            case marketingUrl
            case privacyPolicyUrl
            case tvOsPrivacyPolicy

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaAppLocalizations(rawValue: string) {
                    self = value
                } else if let value = BetaAppLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaAppLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum BetaAppReviewDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case contactEmail
            case contactFirstName
            case contactLastName
            case contactPhone
            case demoAccountName
            case demoAccountPassword
            case demoAccountRequired
            case notes

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaAppReviewDetails(rawValue: string) {
                    self = value
                } else if let value = BetaAppReviewDetails(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaAppReviewDetails value: \(string)"
                    )
                }
            }
        }

        public enum BetaGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case betaRecruitmentCriteria
            case betaRecruitmentCriterionCompatibleBuildCheck
            case betaTesters
            case builds
            case createdDate
            case feedbackEnabled
            case hasAccessToAllBuilds
            case iosBuildsAvailableForAppleSiliconMac
            case iosBuildsAvailableForAppleVision
            case isInternalGroup
            case name
            case publicLink
            case publicLinkEnabled
            case publicLinkId
            case publicLinkLimit
            case publicLinkLimitEnabled

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaGroups(rawValue: string) {
                    self = value
                } else if let value = BetaGroups(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaGroups value: \(string)"
                    )
                }
            }
        }

        public enum BetaLicenseAgreements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaLicenseAgreements(rawValue: string) {
                    self = value
                } else if let value = BetaLicenseAgreements(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaLicenseAgreements value: \(string)"
                    )
                }
            }
        }

        public enum BuildIcons: String, Sendable, ParameterValue, Codable, CaseIterable {
            case iconAsset
            case iconType
            case masked
            case name

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BuildIcons(rawValue: string) {
                    self = value
                } else if let value = BuildIcons(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BuildIcons value: \(string)"
                    )
                }
            }
        }

        public enum Builds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appEncryptionDeclaration
            case appStoreVersion
            case betaAppReviewSubmission
            case betaBuildLocalizations
            case betaGroups
            case buildAudienceType
            case buildBetaDetail
            case buildBundles
            case buildUpload
            case computedMinMacOsVersion
            case computedMinVisionOsVersion
            case diagnosticSignatures
            case expirationDate
            case expired
            case iconAssetToken
            case icons
            case individualTesters
            case lsMinimumSystemVersion
            case minOsVersion
            case perfPowerMetrics
            case preReleaseVersion
            case processingState
            case uploadedDate
            case usesNonExemptEncryption
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Builds(rawValue: string) {
                    self = value
                } else if let value = Builds(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Builds value: \(string)"
                    )
                }
            }
        }

        public enum CiProducts: String, Sendable, ParameterValue, Codable, CaseIterable {
            case additionalRepositories
            case app
            case buildRuns
            case bundleId
            case createdDate
            case name
            case primaryRepositories
            case productType
            case workflows

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiProducts(rawValue: string) {
                    self = value
                } else if let value = CiProducts(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiProducts value: \(string)"
                    )
                }
            }
        }

        public enum EndUserLicenseAgreements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
            case territories

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = EndUserLicenseAgreements(rawValue: string) {
                    self = value
                } else if let value = EndUserLicenseAgreements(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid EndUserLicenseAgreements value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case achievementReleases
            case activityReleases
            case app
            case arcadeEnabled
            case blockedPlayers
            case challengeEnabled
            case challengeReleases
            case challengesMinimumPlatformVersions
            case defaultGroupLeaderboard
            case defaultGroupLeaderboardV2
            case defaultLeaderboard
            case defaultLeaderboardV2
            case gameCenterAchievements
            case gameCenterAchievementsV2
            case gameCenterActivities
            case gameCenterAppVersions
            case gameCenterChallenges
            case gameCenterGroup
            case gameCenterLeaderboardSets
            case gameCenterLeaderboardSetsV2
            case gameCenterLeaderboards
            case gameCenterLeaderboardsV2
            case leaderboardReleases
            case leaderboardSetReleases

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterDetails(rawValue: string) {
                    self = value
                } else if let value = GameCenterDetails(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterDetails value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterEnabledVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case compatibleVersions
            case iconAsset
            case platform
            case versionString

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterEnabledVersions(rawValue: string) {
                    self = value
                } else if let value = GameCenterEnabledVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterEnabledVersions value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case apps
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
            case images
            case inAppPurchaseAvailability
            case inAppPurchaseLocalizations
            case inAppPurchaseType
            case name
            case offerCodes
            case pricePoints
            case productId
            case promotedPurchase
            case referenceName
            case reviewNote
            case state
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchases(rawValue: string) {
                    self = value
                } else if let value = InAppPurchases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchases value: \(string)"
                    )
                }
            }
        }

        public enum PreReleaseVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case builds
            case platform
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PreReleaseVersions(rawValue: string) {
                    self = value
                } else if let value = PreReleaseVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PreReleaseVersions value: \(string)"
                    )
                }
            }
        }

        public enum PromotedPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case enabled
            case inAppPurchaseV2
            case state
            case subscription
            case visibleForAllUsers

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PromotedPurchases(rawValue: string) {
                    self = value
                } else if let value = PromotedPurchases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PromotedPurchases value: \(string)"
                    )
                }
            }
        }

        public enum ReviewSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionForReview
            case items
            case lastUpdatedByActor
            case platform
            case state
            case submittedByActor
            case submittedDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ReviewSubmissions(rawValue: string) {
                    self = value
                } else if let value = ReviewSubmissions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ReviewSubmissions value: \(string)"
                    )
                }
            }
        }

        public enum SubscriptionGracePeriods: String, Sendable, ParameterValue, Codable, CaseIterable {
            case duration
            case optIn
            case renewalType
            case sandboxOptIn

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionGracePeriods(rawValue: string) {
                    self = value
                } else if let value = SubscriptionGracePeriods(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionGracePeriods value: \(string)"
                    )
                }
            }
        }

        public enum SubscriptionGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case referenceName
            case subscriptionGroupLocalizations
            case subscriptions
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionGroups(rawValue: string) {
                    self = value
                } else if let value = SubscriptionGroups(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionGroups value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'appStoreVersions'
        case appStoreVersions([String])
        /// Filter by attribute 'appStoreVersions.appStoreState'
        case appStoreVersions_appStoreState([AppStoreVersionState])
        /// Filter by attribute 'appStoreVersions.appVersionState'
        case appStoreVersions_appVersionState([AppVersionState])
        /// Filter by attribute 'appStoreVersions.platform'
        case appStoreVersions_platform([Platform])
        /// Filter by attribute 'bundleId'
        case bundleId([String])
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'name'
        case name([String])
        /// Filter by attribute 'reviewSubmissions.platform'
        case reviewSubmissions_platform([Platform])
        /// Filter by attribute 'reviewSubmissions.state'
        case reviewSubmissions_state([ReviewSubmissionsState])
        /// Filter by attribute 'sku'
        case sku([String])

        public enum ReviewSubmissionsState: String, Sendable, ParameterValue, Codable, CaseIterable {
            case canceling = "CANCELING"
            case complete = "COMPLETE"
            case completing = "COMPLETING"
            case inReview = "IN_REVIEW"
            case readyForReview = "READY_FOR_REVIEW"
            case unresolvedIssues = "UNRESOLVED_ISSUES"
            case waitingForReview = "WAITING_FOR_REVIEW"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ReviewSubmissionsState(rawValue: string) {
                    self = value
                } else if let value = ReviewSubmissionsState(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ReviewSubmissionsState value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs to check for existence.
     */
    public enum Exist: ExistParameter {
        /// Filter by existence or non-existence of related 'gameCenterEnabledVersions'
        case gameCenterEnabledVersions(Bool)
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case androidToIosAppMappingDetails
        case appClips
        case appCustomProductPages
        case appEncryptionDeclarations
        case appEvents
        case appInfos
        case appStoreIcon
        case appStoreVersionExperimentsV2
        case appStoreVersions
        case betaAppLocalizations
        case betaAppReviewDetail
        case betaGroups
        case betaLicenseAgreement
        case builds
        case ciProduct
        case endUserLicenseAgreement
        case gameCenterDetail
        case gameCenterEnabledVersions
        case inAppPurchases
        case inAppPurchasesV2
        case preReleaseVersions
        case promotedPurchases
        case reviewSubmissions
        case subscriptionGracePeriod
        case subscriptionGroups
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case bundleIdAscending = "bundleId"
        case bundleIdDescending = "-bundleId"
        case nameAscending = "name"
        case nameDescending = "-name"
        case skuAscending = "sku"
        case skuDescending = "-sku"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related androidToIosAppMappingDetails returned (when they are included) - maximum 50
        case androidToIosAppMappingDetails(Int)
        /// Maximum number of related appClips returned (when they are included) - maximum 50
        case appClips(Int)
        /// Maximum number of related appCustomProductPages returned (when they are included) - maximum 50
        case appCustomProductPages(Int)
        /// Maximum number of related appEncryptionDeclarations returned (when they are included) - maximum 50
        case appEncryptionDeclarations(Int)
        /// Maximum number of related appEvents returned (when they are included) - maximum 50
        case appEvents(Int)
        /// Maximum number of related appInfos returned (when they are included) - maximum 50
        case appInfos(Int)
        /// Maximum number of related appStoreVersionExperimentsV2 returned (when they are included) - maximum 50
        case appStoreVersionExperimentsV2(Int)
        /// Maximum number of related appStoreVersions returned (when they are included) - maximum 50
        case appStoreVersions(Int)
        /// Maximum number of related betaAppLocalizations returned (when they are included) - maximum 50
        case betaAppLocalizations(Int)
        /// Maximum number of related betaGroups returned (when they are included) - maximum 50
        case betaGroups(Int)
        /// Maximum number of related builds returned (when they are included) - maximum 50
        case builds(Int)
        /// Maximum number of related gameCenterEnabledVersions returned (when they are included) - maximum 50
        case gameCenterEnabledVersions(Int)
        /// Maximum number of related inAppPurchases returned (when they are included) - maximum 50
        case inAppPurchases(Int)
        /// Maximum number of related inAppPurchasesV2 returned (when they are included) - maximum 50
        case inAppPurchasesV2(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related preReleaseVersions returned (when they are included) - maximum 50
        case preReleaseVersions(Int)
        /// Maximum number of related promotedPurchases returned (when they are included) - maximum 50
        case promotedPurchases(Int)
        /// Maximum number of related reviewSubmissions returned (when they are included) - maximum 50
        case reviewSubmissions(Int)
        /// Maximum number of related subscriptionGroups returned (when they are included) - maximum 50
        case subscriptionGroups(Int)
    }
}
