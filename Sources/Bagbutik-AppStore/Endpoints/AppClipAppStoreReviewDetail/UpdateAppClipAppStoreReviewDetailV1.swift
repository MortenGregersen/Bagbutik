import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify App Store Review Details for an App Clip
     Update App Clip metadata you provide to App Store Review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipAppStoreReviewDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipAppStoreReviewDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipAppStoreReviewDetailV1(id: String,
                                                    requestBody: AppClipAppStoreReviewDetailUpdateRequest) -> Request<AppClipAppStoreReviewDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipAppStoreReviewDetails/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
