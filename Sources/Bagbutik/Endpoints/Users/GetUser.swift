public extension Request {
    /**
      # Read User Information
      Get information about a user on your team, such as name, roles, and app visibility.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_user_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related visibleApps returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getUser(id: String,
                        fields: [GetUser.Field]? = nil,
                        includes: [GetUser.Include]? = nil,
                        limit: Int? = nil) -> Request<UserResponse, ErrorResponse>
    {
        return .init(path: "/v1/users/\(id)", method: .get, parameters: .init(fields: fields,
                                                                              includes: includes,
                                                                              limit: limit))
    }
}

public enum GetUser {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type users
        case users([Users])

        public enum Apps: String, ParameterValue, CaseIterable {
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
            case sku
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case visibleApps
    }
}
