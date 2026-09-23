import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app store review attachment

     Attach a document for App Review to an App Store version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreReviewAttachments>

     - Parameter requestBody: AppStoreReviewAttachment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreReviewAttachmentV1(requestBody: AppStoreReviewAttachmentCreateRequest) -> Request<AppStoreReviewAttachmentResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreReviewAttachments",
            method: .post,
            requestBody: requestBody)
    }
}
