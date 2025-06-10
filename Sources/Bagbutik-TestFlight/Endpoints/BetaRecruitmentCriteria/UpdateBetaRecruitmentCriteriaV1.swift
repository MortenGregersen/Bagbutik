import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify recruitment criteria
     Update the recruitment criteria for your TestFlight build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-betaRecruitmentCriteria-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaRecruitmentCriterion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaRecruitmentCriteriaV1(id: String,
                                                requestBody: BetaRecruitmentCriterionUpdateRequest) -> Request<BetaRecruitmentCriterionResponse, ErrorResponse> {
        .init(
            path: "/v1/betaRecruitmentCriteria/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
