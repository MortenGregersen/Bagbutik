import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # PATCH /v1/reviewSubmissionItems/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_reviewsubmissionitems_id>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: ReviewSubmissionItem representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateReviewSubmissionItemV1(id: String,
                                             requestBody: ReviewSubmissionItemUpdateRequest) -> Request<ReviewSubmissionItemResponse, ErrorResponse>
    {
        .init(path: "/v1/reviewSubmissionItems/\(id)", method: .patch, requestBody: requestBody)
    }
}
