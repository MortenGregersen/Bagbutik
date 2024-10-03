import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Store Review Attachment
     Remove an attachment before you send your app to App Review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appStoreReviewAttachments-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppStoreReviewAttachmentV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appStoreReviewAttachments/\(id)", method: .delete)
    }
}
