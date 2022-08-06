import Bagbutik_Models

public extension Request {
    /**
     # List Invited Users
     Get a list of pending invitations to join your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_invited_users>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listUserInvitationsV1(fields: [ListUserInvitationsV1.Field]? = nil,
                                      filters: [ListUserInvitationsV1.Filter]? = nil,
                                      includes: [ListUserInvitationsV1.Include]? = nil,
                                      sorts: [ListUserInvitationsV1.Sort]? = nil,
                                      limits: [ListUserInvitationsV1.Limit]? = nil) -> Request<UserInvitationsResponse, ErrorResponse>
    {
        .init(path: "/v1/userInvitations", method: .get, parameters: .init(fields: fields,
                                                                           filters: filters,
                                                                           includes: includes,
                                                                           sorts: sorts,
                                                                           limits: limits))
    }
}

public enum ListUserInvitationsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type userInvitations
        case userInvitations([UserInvitations])

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

        public enum UserInvitations: String, ParameterValue, CaseIterable {
            case allAppsVisible
            case email
            case expirationDate
            case firstName
            case lastName
            case provisioningAllowed
            case roles
            case visibleApps
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'email'
        case email([String])
        /// Filter by attribute 'roles'
        case roles([Roles])
        /// Filter by id(s) of related 'visibleApps'
        case visibleApps([String])

        public enum Roles: String, ParameterValue, CaseIterable {
            case admin = "ADMIN"
            case finance = "FINANCE"
            case accountHolder = "ACCOUNT_HOLDER"
            case sales = "SALES"
            case marketing = "MARKETING"
            case appManager = "APP_MANAGER"
            case developer = "DEVELOPER"
            case accessToReports = "ACCESS_TO_REPORTS"
            case customerSupport = "CUSTOMER_SUPPORT"
            case imageManager = "IMAGE_MANAGER"
            case createApps = "CREATE_APPS"
            case cloudManagedDeveloperId = "CLOUD_MANAGED_DEVELOPER_ID"
            case cloudManagedAppDistribution = "CLOUD_MANAGED_APP_DISTRIBUTION"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case visibleApps
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter {
        case emailAscending = "email"
        case emailDescending = "-email"
        case lastNameAscending = "lastName"
        case lastNameDescending = "-lastName"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related visibleApps returned (when they are included) - maximum 50
        case visibleApps(Int)
    }
}
