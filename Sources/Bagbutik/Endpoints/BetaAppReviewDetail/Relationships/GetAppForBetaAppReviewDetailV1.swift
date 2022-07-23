public extension Request {
    /**
      # Read the App Information of a Beta App Review Detail
      Get the app information for a specific beta app review details resource.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_information_of_a_beta_app_review_detail>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppForBetaAppReviewDetailV1(id: String,
                                               fields: [GetAppForBetaAppReviewDetailV1.Field]? = nil) -> Request<AppResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppReviewDetails/\(id)/app", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAppForBetaAppReviewDetailV1 {
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
}
