import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Beta App Localizations of an App
     Get a list of localized beta test information for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_beta_app_localizations_of_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaAppLocalizationsForAppV1(id: String,
                                                 fields: [ListBetaAppLocalizationsForAppV1.Field]? = nil,
                                                 limit: Int? = nil) -> Request<BetaAppLocalizationsResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/betaAppLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                           limit: limit))
    }
}

public enum ListBetaAppLocalizationsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppLocalizations
        case betaAppLocalizations([BetaAppLocalizations])

        public enum BetaAppLocalizations: String, ParameterValue, Codable, CaseIterable {
            case app
            case description
            case feedbackEmail
            case locale
            case marketingUrl
            case privacyPolicyUrl
            case tvOsPrivacyPolicy
        }
    }
}
