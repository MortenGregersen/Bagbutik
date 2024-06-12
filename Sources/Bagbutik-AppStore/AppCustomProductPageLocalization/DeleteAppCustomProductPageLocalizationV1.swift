import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an app custom product page localization
     Delete localized metadata that you configured for a custom product page.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appcustomproductpagelocalizations_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppCustomProductPageLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appCustomProductPageLocalizations/\(id)", method: .delete)
    }
}
