import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/betaAppReviewDetails/{id}/relationships/app

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaAppReviewDetails-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppIdsForBetaAppReviewDetailV1(id: String) -> Request<BetaAppReviewDetailAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppReviewDetails/\(id)/relationships/app",
            method: .get)
    }
}
