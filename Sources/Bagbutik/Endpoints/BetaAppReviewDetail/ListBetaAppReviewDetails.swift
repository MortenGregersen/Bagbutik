public extension Request {
    /**
      # List Beta App Review Details
      Find and list beta app review details for all apps.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_beta_app_review_details>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaAppReviewDetails(fields: [ListBetaAppReviewDetails.Field]? = nil,
                                         filters: [ListBetaAppReviewDetails.Filter]? = nil,
                                         includes: [ListBetaAppReviewDetails.Include]? = nil,
                                         limit: Int? = nil) -> Request<BetaAppReviewDetailsResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppReviewDetails", method: .get, parameters: .init(fields: fields,
                                                                                       filters: filters,
                                                                                       includes: includes,
                                                                                       limit: limit))
    }
}

public enum ListBetaAppReviewDetails {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type betaAppReviewDetails
        case betaAppReviewDetails([BetaAppReviewDetails])

        public enum Apps: String, ParameterValue, CaseIterable {
            case appClips
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
            case sku
        }

        public enum BetaAppReviewDetails: String, ParameterValue, CaseIterable {
            case app
            case contactEmail
            case contactFirstName
            case contactLastName
            case contactPhone
            case demoAccountName
            case demoAccountPassword
            case demoAccountRequired
            case notes
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.

     Required: app
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'app'
        case app([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app
    }
}
