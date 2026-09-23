import BagbutikCore
import BagbutikMarketplacesModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete a marketplace search detail url

     Delete search detail URL for the alternative marketplace.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     DELETE https://api.appstoreconnect.apple.com/v1/marketplaceSearchDetails/{id}
     ```

     **Response:**

     ```json
     204
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-marketplaceSearchDetails-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteMarketplaceSearchDetailV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/marketplaceSearchDetails/\(id)",
            method: .delete)
    }
}
