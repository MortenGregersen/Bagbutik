import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Beta Build Localization
     Update the localized What’s New text for a specific beta build and locale.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-betaBuildLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaBuildLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaBuildLocalizationV1(id: String,
                                              requestBody: BetaBuildLocalizationUpdateRequest) -> Request<BetaBuildLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaBuildLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
