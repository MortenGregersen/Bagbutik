import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a Review Submission

     Create a review submission for a specific app.

     ## Overview> The attribute `platform` is no longer required when using ``doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/POST-v1-reviewSubmissions``. You can optionally add the attribute platform when using ``doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/PATCH-v1-reviewSubmissions-_id_``.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-reviewSubmissions>

     - Parameter requestBody: ReviewSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createReviewSubmissionV1(requestBody: ReviewSubmissionCreateRequest) -> Request<ReviewSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/reviewSubmissions",
            method: .post,
            requestBody: requestBody)
    }
}
