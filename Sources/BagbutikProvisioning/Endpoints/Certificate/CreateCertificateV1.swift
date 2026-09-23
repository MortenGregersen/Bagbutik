import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Create a certificate

     Create a new certificate using a certificate signing request.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-certificates>

     - Parameter requestBody: Certificate representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createCertificateV1(requestBody: CertificateCreateRequest) -> Request<CertificateResponse, ErrorResponse> {
        .init(
            path: "/v1/certificates",
            method: .post,
            requestBody: requestBody)
    }
}
