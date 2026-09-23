import BagbutikCore
import BagbutikAppStoreModels
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Get the marketplace search detail ID for an app

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-marketplaceSearchDetail>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMarketplaceSearchDetailIdsForAppV1(id: String) -> Request<AppMarketplaceSearchDetailLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/marketplaceSearchDetail",
            method: .get)
    }
}
