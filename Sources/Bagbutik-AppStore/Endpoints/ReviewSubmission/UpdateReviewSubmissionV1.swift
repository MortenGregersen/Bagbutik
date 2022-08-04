import Bagbutik_Core

public extension Request {
    /**
     # PATCH /v1/reviewSubmissions/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_reviewsubmissions_id>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: ReviewSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateReviewSubmissionV1(id: String,
                                         requestBody: ReviewSubmissionUpdateRequest) -> Request<ReviewSubmissionResponse, ErrorResponse>
    {
        .init(path: "/v1/reviewSubmissions/\(id)", method: .patch, requestBody: requestBody)
    }
}
