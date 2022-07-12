public extension Request {
    /**
      # List All Prices for an App
      Get current price tier of an app and any future planned price changes.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_prices_for_an_app>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPricesForAppV1(id: String,
                                   fields: [ListPricesForAppV1.Field]? = nil,
                                   includes: [ListPricesForAppV1.Include]? = nil,
                                   limit: Int? = nil) -> Request<AppPricesResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/prices", method: .get, parameters: .init(fields: fields,
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

        public enum AppPriceTiers: String, ParameterValue, CaseIterable {
            case pricePoints
        }

        public enum AppPrices: String, ParameterValue, CaseIterable {
            case app
            case priceTier
        }

        public enum Apps: String, ParameterValue, CaseIterable {
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
            case endUserLicenseAgreement
            case gameCenterEnabledVersions
            case inAppPurchases
            case isOrEverWasMadeForKids
            case name
            case perfPowerMetrics
            case preOrder
            case preReleaseVersions
            case pricePoints
            case prices
            case primaryLocale
            case reviewSubmissions
            case sku
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app, priceTier
    }
}
