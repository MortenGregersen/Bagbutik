import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a marketplace domain
     Add an alternative marketplace domain to your account.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/add_a_marketplace_domain>

     - Parameter requestBody: MarketplaceDomain representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createMarketplaceDomainV1(requestBody: MarketplaceDomainCreateRequest) -> Request<MarketplaceDomainResponse, ErrorResponse> {
        .init(path: "/v1/marketplaceDomains", method: .post, requestBody: requestBody)
    }
}
