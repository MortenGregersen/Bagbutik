import Bagbutik_Core

public extension Request {
    /**
     # Delete an App Custom Product Page
     Delete metadata that you configured for a custom product page.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appcustomproductpages_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppCustomProductPageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appCustomProductPages/\(id)", method: .delete)
    }
}
