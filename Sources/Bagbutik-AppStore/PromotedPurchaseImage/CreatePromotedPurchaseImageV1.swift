import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Promoted Purchase Image for an In-App Purchase
     Reserve an image asset to appear in the App Store, representing a promoted in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-promotedPurchaseImages>

     - Parameter requestBody: PromotedPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createPromotedPurchaseImageV1(requestBody: PromotedPurchaseImageCreateRequest) -> Request<PromotedPurchaseImageResponse, ErrorResponse> {
        .init(path: "/v1/promotedPurchaseImages", method: .post, requestBody: requestBody)
    }
}
