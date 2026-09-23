import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify app store review details for an app clip

     Update App Clip metadata you provide to App Store Review.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
