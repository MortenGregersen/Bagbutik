import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/winBackOffers/{id}/relationships/prices

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-winBackOffers-_id_-relationships-prices>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPriceIdsForWinBackOfferV1(id: String,
                                              limit: Int? = nil) -> Request<WinBackOfferPricesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/winBackOffers/\(id)/relationships/prices",
            method: .get,
            parameters: .init(limit: limit))
    }
}
