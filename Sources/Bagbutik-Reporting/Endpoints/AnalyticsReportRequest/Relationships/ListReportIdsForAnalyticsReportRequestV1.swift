import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read reports Ids for a specific request
     Get a list of reports Ids from a specific analytics report request.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsReportRequests-_id_-relationships-reports>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listReportIdsForAnalyticsReportRequestV1(id: String,
                                                         limit: Int? = nil) -> Request<AnalyticsReportRequestReportsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReportRequests/\(id)/relationships/reports",
            method: .get,
            parameters: .init(limit: limit))
    }
}
