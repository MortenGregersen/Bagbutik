import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-retentionOffers-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: RetentionOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateRetentionOfferV1(id: String,
                                       requestBody: RetentionOfferUpdateRequest) -> Request<RetentionOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionOffers/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
