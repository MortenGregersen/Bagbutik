import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List price IDs for a win-back offer

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
