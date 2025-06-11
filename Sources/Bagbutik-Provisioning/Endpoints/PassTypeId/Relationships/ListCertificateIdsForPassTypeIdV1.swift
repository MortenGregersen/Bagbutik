import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/passTypeIds/{id}/relationships/certificates

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-passTypeIds-_id_-relationships-certificates>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCertificateIdsForPassTypeIdV1(id: String,
                                                  limit: Int? = nil) -> Request<PassTypeIdCertificatesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/passTypeIds/\(id)/relationships/certificates",
            method: .get,
            parameters: .init(limit: limit))
    }
}
