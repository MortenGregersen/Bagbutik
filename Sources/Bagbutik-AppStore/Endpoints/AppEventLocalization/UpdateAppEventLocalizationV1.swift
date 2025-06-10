import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # PATCH /v1/appEventLocalizations/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appEventLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppEventLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppEventLocalizationV1(id: String,
                                             requestBody: AppEventLocalizationUpdateRequest) -> Request<AppEventLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
