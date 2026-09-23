import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List All Price Points for an App

     Get all the available price points for a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPricePoints?filter%5Bterritory%5D=USA,CAN&include=territory&limit=5
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appPricePoints",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDAifQ",
         "attributes" : {
           "customerPrice" : "0.0",
           "proceeds" : "0.0"
         },
         "relationships" : {
           "equalizations" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDAifQ/relationships/equalizations",
               "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDAifQ/equalizations"
             }
           },
           "territory" : {
             "data" : {
               "type" : "territories",
               "id" : "CAN"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDAifQ"
         }
       }, {
         "type" : "appPricePoints",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ",
         "attributes" : {
           "customerPrice" : "1.39",
           "proceeds" : "0.97"
         },
         "relationships" : {
           "equalizations" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ/relationships/equalizations",
               "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ/equalizations"
             }
           },
           "territory" : {
             "data" : {
               "type" : "territories",
               "id" : "CAN"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ"
         }
       }, {
         "type" : "appPricePoints",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDIifQ",
         "attributes" : {
           "customerPrice" : "2.79",
           "proceeds" : "1.95"
         },
         "relationships" : {
           "equalizations" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDIifQ/relationships/equalizations",
               "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDIifQ/equalizations"
             }
           },
           "territory" : {
             "data" : {
               "type" : "territories",
               "id" : "CAN"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDIifQ"
         }
       }, {
         "type" : "appPricePoints",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDMifQ",
         "attributes" : {
           "customerPrice" : "3.99",
           "proceeds" : "2.79"
         },
         "relationships" : {
           "equalizations" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDMifQ/relationships/equalizations",
               "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDMifQ/equalizations"
             }
           },
           "territory" : {
             "data" : {
               "type" : "territories",
               "id" : "CAN"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDMifQ"
         }
       }, {
         "type" : "appPricePoints",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDQifQ",
         "attributes" : {
           "customerPrice" : "5.49",
           "proceeds" : "3.84"
         },
         "relationships" : {
           "equalizations" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDQifQ/relationships/equalizations",
               "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDQifQ/equalizations"
             }
           },
           "territory" : {
             "data" : {
               "type" : "territories",
               "id" : "CAN"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDQifQ"
         }
       } ],
       "included" : [ {
         "type" : "territories",
         "id" : "CAN",
         "attributes" : {
           "currency" : "CAD"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/territories/CAN"
         }
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPricePoints?include=territory&filter%5Bterritory%5D=CAN%2CUSA&limit=5",
         "next" : "https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPricePoints?cursor=BQ.AMN1C2M&include=territory&filter%5Bterritory%5D=CAN%2CUSA&limit=5"
       },
       "meta" : {
         "paging" : {
           "total" : 1602,
           "limit" : 5
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-appPricePoints>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppPricePointsForAppV1(id: String,
                                           fields: [ListAppPricePointsForAppV1.Field]? = nil,
                                           filters: [ListAppPricePointsForAppV1.Filter]? = nil,
                                           includes: [ListAppPricePointsForAppV1.Include]? = nil,
                                           limit: Int? = nil) -> Request<AppPricePointsV3Response, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/appPricePoints",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListAppPricePointsForAppV1 {
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
