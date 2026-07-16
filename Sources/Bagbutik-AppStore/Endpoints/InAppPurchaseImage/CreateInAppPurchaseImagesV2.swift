import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an in-app purchase image
     Reserve a promotion image for an in-app purchase configured with the v2 API and prepare its asset upload.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-inAppPurchaseImages>

     - Parameter requestBody: InAppPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseImagesV2(requestBody: InAppPurchaseImageV2CreateRequest) -> Request<InAppPurchaseImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchaseImages",
            method: .post,
            requestBody: requestBody)
    }
}
