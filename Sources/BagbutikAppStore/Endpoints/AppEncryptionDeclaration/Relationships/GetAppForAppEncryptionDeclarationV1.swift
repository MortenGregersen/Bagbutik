import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the app information of an app encryption declaration

     Get the app information from a specific app encryption declaration.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/69ab60b8-2f7a-91d4-e053-5b8c7c110c82/app
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "apps",
         "id" : "6446671329",
         "attributes" : {
           "name" : "Your Next Cortado",
           "bundleId" : "com.bdt.ync",
           "sku" : "YNC",
           "primaryLocale" : "en-US",
           "isOrEverWasMadeForKids" : false,
           "subscriptionStatusUrl" : null,
           "subscriptionStatusUrlVersion" : null,
           "subscriptionStatusUrlForSandbox" : null,
           "subscriptionStatusUrlVersionForSandbox" : null,
           "availableInNewTerritories" : true,
           "contentRightsDeclaration" : "DOES_NOT_USE_THIRD_PARTY_CONTENT"
         },
         "relationships" : {
           "ciProduct" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/ciProduct",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/ciProduct"
             }
           },
           "betaTesters" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/betaTesters"
             }
           },
           "betaGroups" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/betaGroups",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/betaGroups"
             }
           },
           "appStoreVersions" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/appStoreVersions",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/appStoreVersions"
             }
           },
           "preReleaseVersions" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/preReleaseVersions",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/preReleaseVersions"
             }
           },
           "betaAppLocalizations" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/betaAppLocalizations",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/betaAppLocalizations"
             }
           },
           "builds" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/builds",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/builds"
             }
           },
           "betaLicenseAgreement" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/betaLicenseAgreement",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/betaLicenseAgreement"
             }
           },
           "betaAppReviewDetail" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/betaAppReviewDetail",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/betaAppReviewDetail"
             }
           },
           "appInfos" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/appInfos",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/appInfos"
             }
           },
           "appClips" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/appClips",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/appClips"
             }
           },
           "appPricePoints" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/appPricePoints",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/appPricePoints"
             }
           },
           "pricePoints" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/pricePoints",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/pricePoints"
             }
           },
           "endUserLicenseAgreement" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/endUserLicenseAgreement",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/endUserLicenseAgreement"
             }
           },
           "preOrder" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/preOrder",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/preOrder"
             }
           },
           "prices" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/prices",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/prices"
             }
           },
           "appPriceSchedule" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/appPriceSchedule",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/appPriceSchedule"
             }
           },
           "availableTerritories" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/availableTerritories",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/availableTerritories"
             }
           },
           "appAvailability" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/appAvailability",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/appAvailability"
             }
           },
           "inAppPurchases" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/inAppPurchases",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/inAppPurchases"
             }
           },
           "subscriptionGroups" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/subscriptionGroups",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/subscriptionGroups"
             }
           },
           "gameCenterEnabledVersions" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/gameCenterEnabledVersions",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/gameCenterEnabledVersions"
             }
           },
           "perfPowerMetrics" : {
             "links" : {
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/perfPowerMetrics"
             }
           },
           "appCustomProductPages" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/appCustomProductPages",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/appCustomProductPages"
             }
           },
           "inAppPurchasesV2" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/inAppPurchasesV2",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/inAppPurchasesV2"
             }
           },
           "promotedPurchases" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/promotedPurchases",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/promotedPurchases"
             }
           },
           "appEvents" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/appEvents",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/appEvents"
             }
           },
           "reviewSubmissions" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/reviewSubmissions",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/reviewSubmissions"
             }
           },
           "subscriptionGracePeriod" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/subscriptionGracePeriod",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/subscriptionGracePeriod"
             }
           },
           "customerReviews" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/relationships/customerReviews",
               "related" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329/customerReviews"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/apps/6446671329"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/6c2ddd3b-6d5e-4535-95f9-ece2c72c3848/app"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEncryptionDeclarations-_id_-app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAppForAppEncryptionDeclarationV1(id: String,
                                                    fields: [GetAppForAppEncryptionDeclarationV1.Field]? = nil) -> Request<AppWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/appEncryptionDeclarations/\(id)/app",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAppForAppEncryptionDeclarationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])

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
    }
}
