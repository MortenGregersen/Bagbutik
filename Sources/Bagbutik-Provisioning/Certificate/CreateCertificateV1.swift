import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Certificate
     Create a new certificate using a certificate signing request.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_certificate>

     - Parameter requestBody: Certificate representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createCertificateV1(requestBody: CertificateCreateRequest) -> Request<CertificateResponse, ErrorResponse> {
        .init(path: "/v1/certificates", method: .post, requestBody: requestBody)
    }
}
