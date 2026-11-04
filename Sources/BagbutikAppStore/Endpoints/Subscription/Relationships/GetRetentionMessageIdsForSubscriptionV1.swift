import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-retentionMessage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRetentionMessageIdsForSubscriptionV1(id: String) -> Request<SubscriptionRetentionMessageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/retentionMessage",
            method: .get)
    }
}
