public extension Request {
    /**
      # List Users
      Get a list of the users on your team.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_users>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter sorts: Attributes by which to sort
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listUsers(fields: [ListUsers.Field]? = nil,
                          filters: [ListUsers.Filter]? = nil,
                          includes: [ListUsers.Include]? = nil,
                          sorts: [ListUsers.Sort]? = nil,
                          limits: [ListUsers.Limit]? = nil) -> Request<UsersResponse, ErrorResponse>
    {
        return .init(path: "/v1/users", method: .get, parameters: .init(fields: fields,
                                                                        filters: filters,
                                                                        includes: includes,
                                                                        sorts: sorts,
                                                                        limits: limits))
    }
}

public enum ListUsers {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type users
        case users([Users])

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

        public enum Users: String, ParameterValue, CaseIterable {
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'roles'
        case roles([Roles])
        /// Filter by attribute 'username'
        case username([String])
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
        case lastNameAscending = "lastName"
        case lastNameDescending = "-lastName"
        case usernameAscending = "username"
        case usernameDescending = "-username"
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
