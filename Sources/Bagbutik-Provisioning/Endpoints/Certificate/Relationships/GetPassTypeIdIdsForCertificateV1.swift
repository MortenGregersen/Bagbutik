import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/certificates/{id}/relationships/passTypeId

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-certificates-_id_-relationships-passTypeId>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPassTypeIdIdsForCertificateV1(id: String) -> Request<CertificatePassTypeIdLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/certificates/\(id)/relationships/passTypeId",
            method: .get)
    }
}
