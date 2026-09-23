import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create app store review details for an app clip

     Provide App Clip metadata required by App Store Review.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
