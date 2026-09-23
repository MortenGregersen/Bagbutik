import BagbutikCore
import BagbutikModelsShared
import BagbutikTestFlightModels

public extension Request {
    /**
     # Remove recruitment criteria

     Remove the recruitment criteria for your TestFlight build.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaRecruitmentCriteria-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaRecruitmentCriteriaV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/betaRecruitmentCriteria/\(id)",
            method: .delete)
    }
}
