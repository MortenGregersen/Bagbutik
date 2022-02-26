public extension Request {
    /**
      # Read the App Information of a Beta App Localization
      Get the app information associated with a specific beta app localization.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_information_of_a_beta_app_localization>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppForBetaAppLocalization(id: String,
                                             fields: [GetAppForBetaAppLocalization.Field]? = nil) -> Request<AppResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppLocalizations/\(id)/app", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAppForBetaAppLocalization {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])

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
}
