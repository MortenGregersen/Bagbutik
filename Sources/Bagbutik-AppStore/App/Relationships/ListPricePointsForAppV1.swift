import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Price Points for an App
     Get all the available price points for a specific app.

     The example below requests price points and related price tiers for the USA territory.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_price_points_for_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPricePointsForAppV1(id: String,
                                        fields: [ListPricePointsForAppV1.Field]? = nil,
                                        filters: [ListPricePointsForAppV1.Filter]? = nil,
                                        includes: [ListPricePointsForAppV1.Include]? = nil,
                                        limit: Int? = nil) -> Request<AppPricePointsV2Response, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/pricePoints", method: .get, parameters: .init(fields: fields,
                                                                                  filters: filters,
                                                                                  includes: includes,
                                                                                  limit: limit))
    }
}

public enum ListPricePointsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type appPriceTiers
        case appPriceTiers([AppPriceTiers])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppPricePoints: String, ParameterValue, Codable, CaseIterable {
            case app
            case customerPrice
            case priceTier
            case proceeds
            case territory
        }

        public enum AppPriceTiers: String, ParameterValue, Codable, CaseIterable {
            case pricePoints
        }

        public enum Apps: String, ParameterValue, Codable, CaseIterable {
            case appClips
            case appCustomProductPages
            case appEvents
            case appInfos
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'priceTier'
        case priceTier([String])
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app
        case priceTier
        case territory
    }
}
