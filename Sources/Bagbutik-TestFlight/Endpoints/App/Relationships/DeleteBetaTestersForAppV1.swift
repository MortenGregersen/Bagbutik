import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove specified beta testers from all groups and builds of an app
     Remove one or more beta testers’ access to test any builds of a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-apps-_id_-relationships-betaTesters>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaTestersForAppV1(id: String,
                                          requestBody: AppBetaTestersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/betaTesters",
            method: .delete,
            requestBody: requestBody)
    }
}
