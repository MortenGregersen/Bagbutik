import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create app store review details for an app clip
     Provide App Clip metadata required by App Store Review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appClipAppStoreReviewDetails>

     - Parameter requestBody: AppClipAppStoreReviewDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppClipAppStoreReviewDetailV1(requestBody: AppClipAppStoreReviewDetailCreateRequest) -> Request<AppClipAppStoreReviewDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipAppStoreReviewDetails",
            method: .post,
            requestBody: requestBody)
    }
}
