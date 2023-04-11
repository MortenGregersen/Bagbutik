import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all prices for an app
     Get the current price tier of an app and any future scheduled price changes.

     Use this endpoint to retrieve the price schedule for an app, including the current price and any scheduled future price changes.
     The current price has a `null` start date. Each additional price has a start date that indicates the date when the price will take effect around the world. See [List all price points for an app V1](https://developer.apple.com/documentation/appstoreconnectapi/list_all_price_points_for_an_app_v1) to determine the price the customer sees and the related proceeds in each App Store territory.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_prices_for_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listPricesForAppV1(id: String,
                                   fields: [ListPricesForAppV1.Field]? = nil,
                                   includes: [ListPricesForAppV1.Include]? = nil,
                                   limit: Int? = nil) -> Request<AppPricesResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/prices", method: .get, parameters: .init(fields: fields,
                                                                             includes: includes,
                                                                             limit: limit))
    }
}

public enum ListPricesForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPriceTiers
        case appPriceTiers([AppPriceTiers])
        /// The fields to include for returned resources of type appPrices
        case appPrices([AppPrices])
        /// The fields to include for returned resources of type apps
        case apps([Apps])

        public enum AppPriceTiers: String, ParameterValue, Codable, CaseIterable {
            case pricePoints
        }

        public enum AppPrices: String, ParameterValue, Codable, CaseIterable {
            case app
            case priceTier
        }

        public enum Apps: String, ParameterValue, Codable, CaseIterable {
            case appAvailability
            case appClips
            case appCustomProductPages
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case priceTier
    }
}
