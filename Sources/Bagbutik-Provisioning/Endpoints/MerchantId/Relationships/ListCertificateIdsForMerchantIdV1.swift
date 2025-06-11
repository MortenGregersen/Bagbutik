import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/merchantIds/{id}/relationships/certificates

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-merchantIds-_id_-relationships-certificates>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCertificateIdsForMerchantIdV1(id: String,
                                                  limit: Int? = nil) -> Request<MerchantIdCertificatesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/merchantIds/\(id)/relationships/certificates",
            method: .get,
            parameters: .init(limit: limit))
    }
}
