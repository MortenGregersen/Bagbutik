import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a retention offer

     Update the customer eligibility rules of a specific retention offer.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-retentionOffers-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: RetentionOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateRetentionOfferV1(id: String,
                                       requestBody: RetentionOfferUpdateRequest) -> Request<RetentionOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionOffers/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
