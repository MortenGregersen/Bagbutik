import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a marketplace search detail URL
     Update the search detail URL for the alternative marketplace.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-marketplaceSearchDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: MarketplaceSearchDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateMarketplaceSearchDetailV1(id: String,
                                                requestBody: MarketplaceSearchDetailUpdateRequest) -> Request<MarketplaceSearchDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/marketplaceSearchDetails/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
