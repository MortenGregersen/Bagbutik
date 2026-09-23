import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Modify a Marketplace Webhook Configuration

     Update the endpoint URL and secret for alternative distribution package notifications.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/marketplaceWebhooks/c74970b8-6be0-40fa-8f51-8e1532005635
     {
       "data": {
         "type": "marketplaceWebhooks",
         "id": "c74970b8-6be0-40fa-8f51-8e1532005635",
         "attributes": {
           "endpointUrl": "https://example-2.com/api/ingest/notifications",
           "secret": "mySecret"
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "marketplaceWebhooks",
           "id": "c74970b8-6be0-40fa-8f51-8e1532005635",
           "attributes": {
             "endpointUrl": "https://example-2.com/api/ingest/notifications"
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/marketplaceWebhooks/c74970b8-6be0-40fa-8f51-8e1532005635"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/marketplaceWebhooks"
       },
       "meta": {
         "paging": {
           "total": 1,
           "limit": 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-marketplaceWebhooks-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: MarketplaceWebhook representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateMarketplaceWebhookV1(id: String,
                                           requestBody: MarketplaceWebhookUpdateRequest) -> Request<MarketplaceWebhookResponse, ErrorResponse> {
        .init(
            path: "/v1/marketplaceWebhooks/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
