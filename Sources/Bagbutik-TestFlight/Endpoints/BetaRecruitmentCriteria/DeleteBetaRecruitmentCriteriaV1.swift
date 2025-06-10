import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove recruitment criteria 
     Remove the recruitment criteria for your TestFlight build.

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
