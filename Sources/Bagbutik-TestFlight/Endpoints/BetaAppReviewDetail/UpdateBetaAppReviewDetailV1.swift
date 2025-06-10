import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Beta App Review Detail
     Update the details for a specific app’s beta app review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-betaAppReviewDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaAppReviewDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaAppReviewDetailV1(id: String,
                                            requestBody: BetaAppReviewDetailUpdateRequest) -> Request<BetaAppReviewDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppReviewDetails/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
