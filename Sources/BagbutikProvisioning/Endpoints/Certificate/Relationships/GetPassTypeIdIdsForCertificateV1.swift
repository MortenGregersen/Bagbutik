import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # List passtypeid ids for a certificate

     List all PassTypeIDId Ids for a specific certificate.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
