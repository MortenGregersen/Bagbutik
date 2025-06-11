import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a beta feedback crash submission
     Delete a beta feedback crash submission from your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaFeedbackCrashSubmissions-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaFeedbackCrashSubmissionV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/betaFeedbackCrashSubmissions/\(id)",
            method: .delete)
    }
}
