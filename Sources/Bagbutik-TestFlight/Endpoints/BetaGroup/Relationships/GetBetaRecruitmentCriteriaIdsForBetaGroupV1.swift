import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/betaGroups/{id}/relationships/betaRecruitmentCriteria

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups-_id_-relationships-betaRecruitmentCriteria>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaRecruitmentCriteriaIdsForBetaGroupV1(id: String) -> Request<BetaGroupBetaRecruitmentCriteriaLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)/relationships/betaRecruitmentCriteria",
            method: .get)
    }
}
