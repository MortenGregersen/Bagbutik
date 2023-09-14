import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Beta License Agreement Information
     Get a specific beta license agreement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_license_agreement_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaLicenseAgreementV1(id: String,
                                          fields: [GetBetaLicenseAgreementV1.Field]? = nil,
                                          includes: [GetBetaLicenseAgreementV1.Include]? = nil) -> Request<BetaLicenseAgreementResponse, ErrorResponse>
    {
        .init(path: "/v1/betaLicenseAgreements/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                       includes: includes))
    }
}

public enum GetBetaLicenseAgreementV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type betaLicenseAgreements
        case betaLicenseAgreements([BetaLicenseAgreements])

        public enum Apps: String, ParameterValue, Codable, CaseIterable {
            case appAvailability
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreVersionExperimentsV2
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
            case gameCenterDetail
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

        public enum BetaLicenseAgreements: String, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
    }
}
