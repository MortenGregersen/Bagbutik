import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a Review Submission

     Edit the details or contents of a review submission.

     ## Overview> You can optionally add the attribute platform when using ``doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/PATCH-v1-reviewSubmissions-_id_``.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-reviewSubmissions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: ReviewSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateReviewSubmissionV1(id: String,
                                         requestBody: ReviewSubmissionUpdateRequest) -> Request<ReviewSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/reviewSubmissions/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
