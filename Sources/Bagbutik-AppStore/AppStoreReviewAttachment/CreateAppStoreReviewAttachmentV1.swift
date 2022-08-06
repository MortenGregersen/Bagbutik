import Bagbutik_Models

public extension Request {
    /**
     # Create an App Store Review Attachment
     Attach a document for App Review to an App Store version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_store_review_attachment>

     - Parameter requestBody: AppStoreReviewAttachment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreReviewAttachmentV1(requestBody: AppStoreReviewAttachmentCreateRequest) -> Request<AppStoreReviewAttachmentResponse, ErrorResponse> {
        .init(path: "/v1/appStoreReviewAttachments", method: .post, requestBody: requestBody)
    }
}
