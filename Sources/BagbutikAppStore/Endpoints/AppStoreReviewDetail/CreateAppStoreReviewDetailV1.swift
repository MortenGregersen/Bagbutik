import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app store review detail

     Add App Store review details to an App Store version, including contact and demo account information.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreReviewDetails>

     - Parameter requestBody: AppStoreReviewDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreReviewDetailV1(requestBody: AppStoreReviewDetailCreateRequest) -> Request<AppStoreReviewDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreReviewDetails",
            method: .post,
            requestBody: requestBody)
    }
}
