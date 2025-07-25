import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create recruitment criteria
     Create new criteria for recruiting testers for your TestFlight build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaRecruitmentCriteria>

     - Parameter requestBody: BetaRecruitmentCriterion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaRecruitmentCriteriaV1(requestBody: BetaRecruitmentCriterionCreateRequest) -> Request<BetaRecruitmentCriterionResponse, ErrorResponse> {
        .init(
            path: "/v1/betaRecruitmentCriteria",
            method: .post,
            requestBody: requestBody)
    }
}
