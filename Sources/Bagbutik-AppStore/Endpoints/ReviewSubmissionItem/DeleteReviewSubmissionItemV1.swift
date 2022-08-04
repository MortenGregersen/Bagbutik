public extension Request {
    /**
     # Remove a Review Submission Item
     Remove a specific item from a review submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_reviewsubmissionitems_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteReviewSubmissionItemV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/reviewSubmissionItems/\(id)", method: .delete)
    }
}
