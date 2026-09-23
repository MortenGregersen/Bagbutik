import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Get the compatible build check ID for a beta group recruitment criterion

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
