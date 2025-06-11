import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all beta feedback screenshot submission IDs for an app
     Get a list of beta feedback screenshot submissions for a specific app.

     List All Introductory Offer Resource IDs for an Auto-Renewable Subscription,Get a list of resource IDs representing introductory offers for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-betaFeedbackScreenshotSubmissions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaFeedbackScreenshotSubmissionIdsForAppV1(id: String,
                                                                limit: Int? = nil) -> Request<AppBetaFeedbackScreenshotSubmissionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/betaFeedbackScreenshotSubmissions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
