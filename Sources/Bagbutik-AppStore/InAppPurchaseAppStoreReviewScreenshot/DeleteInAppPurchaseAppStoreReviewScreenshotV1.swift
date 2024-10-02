import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Review Screenshot for an In-App Purchase
     Delete an image that you uploaded for review of an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-inAppPurchaseAppStoreReviewScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteInAppPurchaseAppStoreReviewScreenshotV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/inAppPurchaseAppStoreReviewScreenshots/\(id)", method: .delete)
    }
}
