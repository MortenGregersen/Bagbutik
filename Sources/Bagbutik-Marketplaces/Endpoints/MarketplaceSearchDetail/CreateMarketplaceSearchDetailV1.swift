import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a marketplace search detail URL
     Add a search detail URL for the alternative marketplace.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-marketplaceSearchDetails>

     - Parameter requestBody: MarketplaceSearchDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createMarketplaceSearchDetailV1(requestBody: MarketplaceSearchDetailCreateRequest) -> Request<MarketplaceSearchDetailResponse, ErrorResponse> {
        .init(path: "/v1/marketplaceSearchDetails", method: .post, requestBody: requestBody)
    }
}
