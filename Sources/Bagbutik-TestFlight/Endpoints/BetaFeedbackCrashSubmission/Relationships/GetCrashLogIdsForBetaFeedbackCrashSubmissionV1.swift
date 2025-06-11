import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/betaFeedbackCrashSubmissions/{id}/relationships/crashLog

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaFeedbackCrashSubmissions-_id_-relationships-crashLog>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCrashLogIdsForBetaFeedbackCrashSubmissionV1(id: String) -> Request<BetaFeedbackCrashSubmissionCrashLogLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/betaFeedbackCrashSubmissions/\(id)/relationships/crashLog",
            method: .get)
    }
}
