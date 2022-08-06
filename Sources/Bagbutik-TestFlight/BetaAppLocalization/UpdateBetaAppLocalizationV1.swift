import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Beta App Localization
     Update the localized What’s New text for a specific app and locale.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_beta_app_localization>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaAppLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaAppLocalizationV1(id: String,
                                            requestBody: BetaAppLocalizationUpdateRequest) -> Request<BetaAppLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/betaAppLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
