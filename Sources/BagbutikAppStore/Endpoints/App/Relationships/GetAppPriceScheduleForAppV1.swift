import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read Price Schedule Information for an App

     Read price schedule details for a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPriceSchedule
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "appPriceSchedules",
         "id" : "6447402192",
         "relationships" : {
           "baseTerritory" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/relationships/baseTerritory",
               "related" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/baseTerritory"
             }
           },
           "manualPrices" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/relationships/manualPrices",
               "related" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/manualPrices"
             }
           },
           "automaticPrices" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/relationships/automaticPrices",
               "related" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/automaticPrices"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPriceSchedule"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-appPriceSchedule>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppPriceScheduleForAppV1(id: String,
                                            fields: [GetAppPriceScheduleForAppV1.Field]? = nil,
                                            includes: [GetAppPriceScheduleForAppV1.Include]? = nil,
                                            limits: [GetAppPriceScheduleForAppV1.Limit]? = nil) -> Request<AppPriceScheduleResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/appPriceSchedule",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetAppPriceScheduleForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPriceSchedules
        case appPriceSchedules([AppPriceSchedules])
        /// The fields to include for returned resources of type appPrices
        case appPrices([AppPrices])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppPriceSchedules: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case automaticPrices
            case baseTerritory
            case manualPrices

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppPriceSchedules(rawValue: string) {
                    self = value
                } else if let value = AppPriceSchedules(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppPriceSchedules value: \(string)"
                    )
                }
            }
        }

        public enum AppPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPricePoint
            case endDate
            case manual
            case startDate
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppPrices(rawValue: string) {
                    self = value
                } else if let value = AppPrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppPrices value: \(string)"
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

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Territories(rawValue: string) {
                    self = value
                } else if let value = Territories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Territories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case automaticPrices
        case baseTerritory
        case manualPrices
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related automaticPrices returned (when they are included) - maximum 50
        case automaticPrices(Int)
        /// Maximum number of related manualPrices returned (when they are included) - maximum 50
        case manualPrices(Int)
    }
}
