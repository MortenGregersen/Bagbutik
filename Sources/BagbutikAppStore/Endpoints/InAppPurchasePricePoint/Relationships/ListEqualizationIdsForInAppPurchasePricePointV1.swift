import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List equalization IDs for an in-app purchase price point

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchasePricePoints-_id_-relationships-equalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 8000
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listEqualizationIdsForInAppPurchasePricePointV1(id: String,
                                                                limit: Int? = nil) -> Request<InAppPurchasePricePointEqualizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePricePoints/\(id)/relationships/equalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
