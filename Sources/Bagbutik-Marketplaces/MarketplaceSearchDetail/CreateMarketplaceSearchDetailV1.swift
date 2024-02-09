import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a marketplace search detail URL
     Add an alternative marketplace search detail URL for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/add_a_marketplace_search_detail_url>

     - Parameter requestBody: MarketplaceSearchDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createMarketplaceSearchDetailV1(requestBody: MarketplaceSearchDetailCreateRequest) -> Request<MarketplaceSearchDetailResponse, ErrorResponse> {
        .init(path: "/v1/marketplaceSearchDetails", method: .post, requestBody: requestBody)
    }
}
