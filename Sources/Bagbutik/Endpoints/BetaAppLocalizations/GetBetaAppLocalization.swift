public extension Request {
    enum GetBetaAppLocalization {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type apps
            case apps([Apps])
            /// The fields to include for returned resources of type betaAppLocalizations
            case betaAppLocalizations([BetaAppLocalizations])

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

            public enum BetaAppLocalizations: String, ParameterValue, CaseIterable {
                case app
                case description
                case feedbackEmail
                case locale
                case marketingUrl
                case privacyPolicyUrl
                case tvOsPrivacyPolicy
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case app
        }
    }

    /**
      # Read Beta App Localization Information
      Get localized beta app information for a specific app and locale.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_app_localization_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBetaAppLocalization(id: String,
                                       fields: [GetBetaAppLocalization.Field]? = nil,
                                       includes: [GetBetaAppLocalization.Include]? = nil) -> Request<BetaAppLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                             includes: includes))
    }
}
