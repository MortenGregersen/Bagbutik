import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Remove a review submission item

     Remove a specific item from a review submission.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-reviewSubmissionItems-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteReviewSubmissionItemV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/reviewSubmissionItems/\(id)",
            method: .delete)
    }
}
