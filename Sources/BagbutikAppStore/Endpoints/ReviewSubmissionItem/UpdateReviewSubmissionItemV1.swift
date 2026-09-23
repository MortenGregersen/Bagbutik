import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Update a review submission item

     Update a specific review submission item.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-reviewSubmissionItems-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: ReviewSubmissionItem representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateReviewSubmissionItemV1(id: String,
                                             requestBody: ReviewSubmissionItemUpdateRequest) -> Request<ReviewSubmissionItemResponse, ErrorResponse> {
        .init(
            path: "/v1/reviewSubmissionItems/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
