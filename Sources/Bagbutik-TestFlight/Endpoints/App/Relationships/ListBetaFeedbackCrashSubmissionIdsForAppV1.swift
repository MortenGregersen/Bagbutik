import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all beta feedback crash submission IDs for an app
     Get a list of beta feedback crash submissions for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-betaFeedbackCrashSubmissions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaFeedbackCrashSubmissionIdsForAppV1(id: String,
                                                           limit: Int? = nil) -> Request<AppBetaFeedbackCrashSubmissionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/betaFeedbackCrashSubmissions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
