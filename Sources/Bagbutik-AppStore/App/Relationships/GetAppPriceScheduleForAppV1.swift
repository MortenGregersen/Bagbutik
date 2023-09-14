import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read price schedule information for an app
     Read price schedule details for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_price_schedule_information_for_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppPriceScheduleForAppV1(id: String,
                                            fields: [GetAppPriceScheduleForAppV1.Field]? = nil,
                                            includes: [GetAppPriceScheduleForAppV1.Include]? = nil,
                                            limits: [GetAppPriceScheduleForAppV1.Limit]? = nil) -> Request<AppPriceScheduleResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/appPriceSchedule", method: .get, parameters: .init(fields: fields,
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

        public enum AppPriceSchedules: String, ParameterValue, Codable, CaseIterable {
            case app
            case automaticPrices
            case baseTerritory
            case manualPrices
        }

        public enum AppPrices: String, ParameterValue, Codable, CaseIterable {
            case appPricePoint
            case endDate
            case manual
            case startDate
            case territory
        }

        public enum Apps: String, ParameterValue, Codable, CaseIterable {
            case appAvailability
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreVersionExperimentsV2
            case appStoreVersions
            case availableInNewTerritories
            case availableTerritories
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterDetail
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case name
            case perfPowerMetrics
            case preOrder
            case preReleaseVersions
            case pricePoints
            case prices
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case sku
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
        }

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
            case currency
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
