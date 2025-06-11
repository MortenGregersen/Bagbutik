import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/apps/{id}/relationships/ciProduct

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-ciProduct>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiProductIdsForAppV1(id: String) -> Request<AppCiProductLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/ciProduct",
            method: .get)
    }
}
