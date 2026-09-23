import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # List beta recruitment criterion IDs for a beta group

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
