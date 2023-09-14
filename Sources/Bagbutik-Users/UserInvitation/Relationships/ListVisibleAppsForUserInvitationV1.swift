import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Apps Visible to an Invited User
     Get a list of apps that will be visible to a user with a pending invitation.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_apps_visible_to_an_invited_user>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVisibleAppsForUserInvitationV1(id: String,
                                                   fields: [ListVisibleAppsForUserInvitationV1.Field]? = nil,
                                                   limit: Int? = nil) -> Request<AppsWithoutIncludesResponse, ErrorResponse>
    {
        .init(path: "/v1/userInvitations/\(id)/visibleApps", method: .get, parameters: .init(fields: fields,
                                                                                             limit: limit))
    }
}

public enum ListVisibleAppsForUserInvitationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])

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
    }
}
