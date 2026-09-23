import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Commit an app store review attachment

     Commit an app screenshot after uploading it to the App Store.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreReviewAttachments-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreReviewAttachment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreReviewAttachmentV1(id: String,
                                                 requestBody: AppStoreReviewAttachmentUpdateRequest) -> Request<AppStoreReviewAttachmentResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreReviewAttachments/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
