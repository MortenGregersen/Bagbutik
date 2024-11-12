import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read User Information
     Get information about a user on your team, such as name, roles, and app visibility.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-users-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related visibleApps returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getUserV1(id: String,
                          fields: [GetUserV1.Field]? = nil,
                          includes: [GetUserV1.Include]? = nil,
                          limit: GetUserV1.Limit? = nil) -> Request<UserResponse, ErrorResponse>
    {
        .init(path: "/v1/users/\(id)", method: .get, parameters: .init(fields: fields,
                                                                       includes: includes,
                                                                       limits: limit.map { [$0] }))
    }
}

public enum GetUserV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type users
        case users([Users])

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

        public enum Users: String, Sendable, ParameterValue, Codable, CaseIterable {
            case allAppsVisible
            case firstName
            case lastName
            case provisioningAllowed
            case roles
            case username
            case visibleApps
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case visibleApps
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related visibleApps returned (when they are included) - maximum 50
        case visibleApps(Int)
    }
}
