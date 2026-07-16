import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an in-app purchase version
     Create a draft version of an in-app purchase, capturing its current localized metadata and review images for App Review submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseVersions>

     - Parameter requestBody: InAppPurchaseVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseVersionV1(requestBody: InAppPurchaseVersionCreateRequest) -> Request<InAppPurchaseVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseVersions",
            method: .post,
            requestBody: requestBody)
    }
}
