import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a report request
     Remove a specific analytics report request.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-analyticsReportRequests-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAnalyticsReportRequestV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReportRequests/\(id)",
            method: .delete)
    }
}
