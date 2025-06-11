import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read a list of a report instant IDs
     Read list of all the instance IDs for a specific type of analytics report.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsReports-_id_-relationships-instances>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listInstanceIdsForAnalyticsReportV1(id: String,
                                                    limit: Int? = nil) -> Request<AnalyticsReportInstancesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReports/\(id)/relationships/instances",
            method: .get,
            parameters: .init(limit: limit))
    }
}
