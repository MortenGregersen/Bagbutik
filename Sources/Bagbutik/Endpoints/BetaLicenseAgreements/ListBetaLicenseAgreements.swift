public extension Request {
    /**
      # List Beta License Agreements
      Find and list beta license agreements for all apps.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_beta_license_agreements>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaLicenseAgreements(fields: [ListBetaLicenseAgreements.Field]? = nil,
                                          filters: [ListBetaLicenseAgreements.Filter]? = nil,
                                          includes: [ListBetaLicenseAgreements.Include]? = nil,
                                          limit: Int? = nil) -> Request<BetaLicenseAgreementsResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaLicenseAgreements", method: .get, parameters: .init(fields: fields,
                                                                                        filters: filters,
                                                                                        includes: includes,
                                                                                        limit: limit))
    }
}

public enum ListBetaLicenseAgreements {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type betaLicenseAgreements
        case betaLicenseAgreements([BetaLicenseAgreements])

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

        public enum BetaLicenseAgreements: String, ParameterValue, CaseIterable {
            case agreementText
            case app
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
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
