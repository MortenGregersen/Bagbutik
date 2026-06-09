import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a beta app localization
     Update the localized information for a specific beta app and locale.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-betaAppLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaAppLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaAppLocalizationV1(id: String,
                                            requestBody: BetaAppLocalizationUpdateRequest) -> Request<BetaAppLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
