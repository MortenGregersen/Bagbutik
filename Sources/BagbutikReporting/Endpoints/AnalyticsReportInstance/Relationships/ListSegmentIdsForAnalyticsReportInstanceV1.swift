import BagbutikCore
import BagbutikReportingModels

public extension Request {
    /**
     # Read segment ids for a report

     Get Ids for a specific analytics report segment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsReportInstances-_id_-relationships-segments>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSegmentIdsForAnalyticsReportInstanceV1(id: String,
                                                           limit: Int? = nil) -> Request<AnalyticsReportInstanceSegmentsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReportInstances/\(id)/relationships/segments",
            method: .get,
            parameters: .init(limit: limit))
    }
}
