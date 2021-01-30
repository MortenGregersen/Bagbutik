public extension Request {
    enum ListBetaAppLocalizationsForApp {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type betaAppLocalizations
            case betaAppLocalizations([BetaAppLocalizations])

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
    }

    /**
      # List All Beta App Localizations of an App
      Get a list of localized beta test information for a specific app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_beta_app_localizations_of_an_app>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaAppLocalizationsForApp(id: String,
                                               fields: [ListBetaAppLocalizationsForApp.Field]? = nil,
                                               limit: Int? = nil) -> Request<BetaAppLocalizationsResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/betaAppLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                                  limit: limit))
    }
}
