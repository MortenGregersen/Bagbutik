import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an app custom product page
     Delete metadata that you configured for a custom product page.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appCustomProductPages-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppCustomProductPageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appCustomProductPages/\(id)", method: .delete)
    }
}
