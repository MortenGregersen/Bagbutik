import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List subscription IDs for a retention message

     Get a list of the subscription IDs that use a specific retention message.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-retentionMessages-_id_-relationships-subscriptions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSubscriptionIdsForRetentionMessageV1(id: String,
                                                         limit: Int? = nil) -> Request<RetentionMessageSubscriptionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessages/\(id)/relationships/subscriptions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
