import BagbutikCore
import BagbutikMarketplacesModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete a Marketplace Webhook Configuration

     Delete a specific marketplace notifcation endpoint URL.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     DELETE https://api.appstoreconnect.apple.com/v1/marketplaceWebhooks/c74970b8-6be0-40fa-8f51-8e1532005635
     ```

     **Response:**

     ```json
     204
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-marketplaceWebhooks-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func deleteMarketplaceWebhookV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/marketplaceWebhooks/\(id)",
            method: .delete)
    }
}
