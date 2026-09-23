import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # List certificate ids for a passtypeid

     List all certificate IDs for a specific pass type ID.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
