import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptions-_id_-relationships-retentionMessageOffers>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createRetentionMessageOffersForSubscriptionV1(id: String,
                                                              requestBody: SubscriptionRetentionMessageOffersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/retentionMessageOffers",
            method: .post,
            requestBody: requestBody)
    }
}
