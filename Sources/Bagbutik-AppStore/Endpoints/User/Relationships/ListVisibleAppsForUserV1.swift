import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Apps Visible to a User
     Get a list of apps that a user on your team can view.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-users-_id_-visibleApps>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVisibleAppsForUserV1(id: String,
                                         fields: [ListVisibleAppsForUserV1.Field]? = nil,
                                         limit: Int? = nil) -> Request<AppsWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/users/\(id)/visibleApps",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListVisibleAppsForUserV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])

        public enum Apps: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKey
            case analyticsReportRequests
            case appAvailabilityV2
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreVersionExperimentsV2
            case appStoreVersions
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
            case marketplaceSearchDetail
            case name
            case perfPowerMetrics
            case preReleaseVersions
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case sku
            case streamlinedPurchasingEnabled
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
        }
    }
}
