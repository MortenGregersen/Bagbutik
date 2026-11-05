import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a retention offer

     Create a retention offer for an auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-retentionOffers>

     - Parameter requestBody: RetentionOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createRetentionOfferV1(requestBody: RetentionOfferCreateRequest) -> Request<RetentionOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionOffers",
            method: .post,
            requestBody: requestBody)
    }
}
