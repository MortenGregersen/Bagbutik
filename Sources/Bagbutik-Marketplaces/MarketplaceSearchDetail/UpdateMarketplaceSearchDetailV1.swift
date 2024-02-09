import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a marketplace search detail URL
     Update the alternative marketplace search detail URL for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_marketplace_search_detail_url>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: MarketplaceSearchDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateMarketplaceSearchDetailV1(id: String,
                                                requestBody: MarketplaceSearchDetailUpdateRequest) -> Request<MarketplaceSearchDetailResponse, ErrorResponse>
    {
        .init(path: "/v1/marketplaceSearchDetails/\(id)", method: .patch, requestBody: requestBody)
    }
}
