import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an image for an in-app purchase
     Reserve an image asset to appear in the App Store, representing an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseImages>

     - Parameter requestBody: InAppPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseImageV1(requestBody: InAppPurchaseImageCreateRequest) -> Request<InAppPurchaseImageResponse, ErrorResponse> {
        .init(path: "/v1/inAppPurchaseImages", method: .post, requestBody: requestBody)
    }
}
