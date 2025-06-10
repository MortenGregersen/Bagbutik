import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/builds/{id}/relationships/betaAppReviewSubmission

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-betaAppReviewSubmission>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaAppReviewSubmissionIdsForBuildV1(id: String) -> Request<BuildBetaAppReviewSubmissionLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/betaAppReviewSubmission",
            method: .get)
    }
}
