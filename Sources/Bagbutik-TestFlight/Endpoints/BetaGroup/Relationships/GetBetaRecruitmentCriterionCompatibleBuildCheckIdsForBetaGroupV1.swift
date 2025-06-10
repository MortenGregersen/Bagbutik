import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/betaGroups/{id}/relationships/betaRecruitmentCriterionCompatibleBuildCheck

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups-_id_-relationships-betaRecruitmentCriterionCompatibleBuildCheck>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaRecruitmentCriterionCompatibleBuildCheckIdsForBetaGroupV1(id: String) -> Request<BetaGroupBetaRecruitmentCriterionCompatibleBuildCheckLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)/relationships/betaRecruitmentCriterionCompatibleBuildCheck",
            method: .get)
    }
}
