import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List App Price Point Equalizations

     List all equivalent app prices points to a base price point.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ/equalizations?filter%5Bterritory%5D=USA,MEX&include=territory&fields%5BappPricePoints%5D=customerPrice,proceeds,territory&limit=5
     ```

     **Response:**

     ```json
     {
       “data” : [ {
         “type” : “appPricePoints”,
         “id” : “eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJNRVgiLCJwIjoiMTAwMDEifQ”,
         “attributes” : {
           “customerPrice” : “19.0”,
           “proceeds” : “13.3”
         },
         “relationships” : {
           “territory” : {
             “data” : {
               “type” : “territories”,
               “id” : “MEX”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJNRVgiLCJwIjoiMTAwMDEifQ”
         }
       }, {
         “type” : “appPricePoints”,
         “id” : “eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDEifQ”,
         “attributes” : {
           “customerPrice” : “0.29”,
           “proceeds” : “0.2”
         },
         “relationships” : {
           “territory” : {
             “data” : {
               “type” : “territories”,
               “id” : “USA”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDEifQ”
         }
       } ],
       “included” : [ {
         “type” : “territories”,
         “id” : “MEX”,
         “attributes” : {
           “currency” : “MXN”
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/territories/MEX”
         }
       }, {
         “type” : “territories”,
         “id” : “USA”,
         “attributes” : {
           “currency” : “USD”
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/territories/USA”
         }
       } ],
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ/equalizations?include=territory&fields%5BappPricePoints%5D=proceeds%2CcustomerPrice%2Cterritory&filter%5Bterritory%5D=MEX%2CUSA&limit=5”
       },
       “meta” : {
         “paging” : {
           “total” : 2,
           “limit” : 5
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v3-appPricePoints-_id_-equalizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listEqualizationsForAppPricePointsV3(id: String,
                                                     fields: [ListEqualizationsForAppPricePointsV3.Field]? = nil,
                                                     filters: [ListEqualizationsForAppPricePointsV3.Filter]? = nil,
                                                     includes: [ListEqualizationsForAppPricePointsV3.Include]? = nil,
                                                     limit: Int? = nil) -> Request<AppPricePointsV3Response, ErrorResponse> {
        .init(
            path: "/v3/appPricePoints/\(id)/equalizations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListEqualizationsForAppPricePointsV3 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case customerPrice
            case equalizations
            case proceeds
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppPricePoints(rawValue: string) {
                    self = value
                } else if let value = AppPricePoints(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppPricePoints value: \(string)"
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case territory
    }
}
