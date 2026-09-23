import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read in-app purchase information

     Get information about an in-app purchase.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/inAppPurchases/6446998023
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "inAppPurchases",
           "id": "6447027998",
           "attributes": {
             "name": "YNC1",
             "productId": "YNCNC1",
             "inAppPurchaseType": "NON_CONSUMABLE",
             "state": "MISSING_METADATA",
             "reviewNote": null,
             "familySharable": false,
             "contentHosting": false,
             "availableInAllTerritories": true
           },
           "relationships": {
             "inAppPurchaseLocalizations": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/inAppPurchaseLocalizations",
                 "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/inAppPurchaseLocalizations"
               }
             },
             "pricePoints": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/pricePoints",
                 "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/pricePoints"
               }
             },
             "content": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/content",
                 "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/content"
               }
             },
             "appStoreReviewScreenshot": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/appStoreReviewScreenshot",
                 "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/appStoreReviewScreenshot"
               }
             },
             "promotedPurchase": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/promotedPurchase",
                 "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/promotedPurchase"
               }
             },
             "iapPriceSchedule": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/relationships/iapPriceSchedule",
                 "related": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998/iapPriceSchedule"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v2/inAppPurchases/6447027998"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/inAppPurchasesV2"
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

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related apps returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getInAppPurchaseV1(id: String,
                                   fields: [GetInAppPurchaseV1.Field]? = nil,
                                   includes: [GetInAppPurchaseV1.Include]? = nil,
                                   limit: GetInAppPurchaseV1.Limit? = nil) -> Request<InAppPurchaseResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchases/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetInAppPurchaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

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

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case apps
            case inAppPurchaseType
            case productId
            case referenceName
            case state

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case apps
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related apps returned (when they are included) - maximum 50
        case apps(Int)
    }
}
