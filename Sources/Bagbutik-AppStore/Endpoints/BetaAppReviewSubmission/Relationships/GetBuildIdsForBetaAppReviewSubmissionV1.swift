import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/betaAppReviewSubmissions/{id}/relationships/build

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaAppReviewSubmissions-_id_-relationships-build>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildIdsForBetaAppReviewSubmissionV1(id: String) -> Request<BetaAppReviewSubmissionBuildLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppReviewSubmissions/\(id)/relationships/build",
            method: .get)
    }
}
