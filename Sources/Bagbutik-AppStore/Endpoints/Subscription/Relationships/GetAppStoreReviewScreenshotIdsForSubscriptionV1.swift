import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptions/{id}/relationships/appStoreReviewScreenshot

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-appStoreReviewScreenshot>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreReviewScreenshotIdsForSubscriptionV1(id: String) -> Request<SubscriptionAppStoreReviewScreenshotLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/appStoreReviewScreenshot",
            method: .get)
    }
}
