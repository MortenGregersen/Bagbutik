import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptions-_id_-relationships-retentionMessage>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateRetentionMessageForSubscriptionV1(id: String,
                                                        requestBody: SubscriptionRetentionMessageLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/retentionMessage",
            method: .patch,
            requestBody: requestBody)
    }
}
