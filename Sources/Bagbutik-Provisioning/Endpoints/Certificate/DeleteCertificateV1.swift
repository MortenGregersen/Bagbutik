import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Revoke a Certificate
     Revoke a lost, stolen, compromised, or expiring signing certificate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-certificates-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCertificateV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/certificates/\(id)", method: .delete)
    }
}
