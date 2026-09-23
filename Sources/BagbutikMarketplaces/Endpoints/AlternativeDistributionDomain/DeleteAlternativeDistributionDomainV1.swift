import BagbutikCore
import BagbutikMarketplacesModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete an Alternative Distribution Domain

     Delete the alternative distribution search domain for an app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     DELETE https://api.appstoreconnect.apple.com/v1/alternativeDistributionDomains/{id}
     ```

     **Response:**

     ```json
     204
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-alternativeDistributionDomains-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAlternativeDistributionDomainV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionDomains/\(id)",
            method: .delete)
    }
}
