import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Commit an App Store Review Attachment
     Commit an app screenshot after uploading it to the App Store.

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
