public extension Request {
    /**
      # Read Beta License Agreement Information
      Get a specific beta license agreement.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_license_agreement_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBetaLicenseAgreement(id: String,
                                        fields: [GetBetaLicenseAgreement.Field]? = nil,
                                        includes: [GetBetaLicenseAgreement.Include]? = nil) -> Request<BetaLicenseAgreementResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaLicenseAgreements/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                              includes: includes))
    }
}

public enum GetBetaLicenseAgreement {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app
    }
}
