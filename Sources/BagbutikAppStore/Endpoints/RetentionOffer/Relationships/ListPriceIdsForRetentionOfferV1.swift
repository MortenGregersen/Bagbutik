import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-retentionOffers-_id_-relationships-prices>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPriceIdsForRetentionOfferV1(id: String,
                                                limit: Int? = nil) -> Request<RetentionOfferPricesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionOffers/\(id)/relationships/prices",
            method: .get,
            parameters: .init(limit: limit))
    }
}
