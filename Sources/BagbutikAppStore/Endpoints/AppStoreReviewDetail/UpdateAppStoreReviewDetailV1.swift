import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an app store review detail

     Update the App Store review details, including the contact information, demo account, and notes.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreReviewDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreReviewDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreReviewDetailV1(id: String,
                                             requestBody: AppStoreReviewDetailUpdateRequest) -> Request<AppStoreReviewDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreReviewDetails/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
