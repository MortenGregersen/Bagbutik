import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Create Recruitment Criteria

     Create new criteria for recruiting testers for your TestFlight build.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
