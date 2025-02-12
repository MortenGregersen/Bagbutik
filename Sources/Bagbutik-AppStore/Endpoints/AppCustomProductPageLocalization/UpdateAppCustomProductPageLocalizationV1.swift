import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify custom product page localization information
     Update the promotional text for an app custom product page localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appCustomProductPageLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppCustomProductPageLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppCustomProductPageLocalizationV1(id: String,
                                                         requestBody: AppCustomProductPageLocalizationUpdateRequest) -> Request<AppCustomProductPageLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/appCustomProductPageLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
