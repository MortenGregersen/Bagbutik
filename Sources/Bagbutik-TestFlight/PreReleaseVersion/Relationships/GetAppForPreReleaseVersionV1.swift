import Bagbutik_Models

public extension Request {
    /**
     # Read the App Information of a Prerelease Version
     Get the app information for a specific prerelease version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_information_of_a_prerelease_version>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppForPreReleaseVersionV1(id: String,
                                             fields: [GetAppForPreReleaseVersionV1.Field]? = nil) -> Request<AppResponse, ErrorResponse>
    {
        .init(path: "/v1/preReleaseVersions/\(id)/app", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAppForPreReleaseVersionV1 {
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
