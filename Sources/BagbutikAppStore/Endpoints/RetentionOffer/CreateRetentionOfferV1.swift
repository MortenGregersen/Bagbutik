import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-retentionOffers>

     - Parameter requestBody: RetentionOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createRetentionOfferV1(requestBody: RetentionOfferCreateRequest) -> Request<RetentionOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionOffers",
            method: .post,
            requestBody: requestBody)
    }
}
