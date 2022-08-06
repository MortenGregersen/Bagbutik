import Bagbutik_Models

public extension Request {
    /**
     # Create a Beta App Localization
     Create localized descriptive information for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_beta_app_localization>

     - Parameter requestBody: BetaAppLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaAppLocalizationV1(requestBody: BetaAppLocalizationCreateRequest) -> Request<BetaAppLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/betaAppLocalizations", method: .post, requestBody: requestBody)
    }
}
