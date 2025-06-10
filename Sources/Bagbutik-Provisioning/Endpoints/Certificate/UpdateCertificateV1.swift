import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a certificate
     Update the activation status for a specific certificate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-certificates-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Certificate representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateCertificateV1(id: String,
                                    requestBody: CertificateUpdateRequest) -> Request<CertificateResponse, ErrorResponse> {
        .init(
            path: "/v1/certificates/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
