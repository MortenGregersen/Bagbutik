public extension Request {
    /**
     # Read Beta App Localization Information
     Get localized beta app information for a specific app and locale.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_app_localization_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaAppLocalizationV1(id: String,
                                         fields: [GetBetaAppLocalizationV1.Field]? = nil,
                                         includes: [GetBetaAppLocalizationV1.Include]? = nil) -> Request<BetaAppLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/betaAppLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                      includes: includes))
    }
}

public enum GetBetaAppLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type betaAppLocalizations
        case betaAppLocalizations([BetaAppLocalizations])

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
