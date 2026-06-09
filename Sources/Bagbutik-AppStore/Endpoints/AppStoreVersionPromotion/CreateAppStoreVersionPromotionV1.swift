import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app store version promotion
     Promote a specific App Store version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreVersionPromotions>

     - Parameter requestBody: AppStoreVersionPromotion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionPromotionV1(requestBody: AppStoreVersionPromotionCreateRequest) -> Request<AppStoreVersionPromotionResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionPromotions",
            method: .post,
            requestBody: requestBody)
    }
}
