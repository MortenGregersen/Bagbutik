import BagbutikCore
import BagbutikModelsShared
import BagbutikReportingModels

public extension Request {
    /**
     # Get the performance overview for an app

     Get the aggregated performance overview data for a specific app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-performanceOverviews>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPerformanceOverviewsForAppV1(id: String,
                                                 filters: [ListPerformanceOverviewsForAppV1.Filter]? = nil) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/performanceOverviews",
            method: .get,
            parameters: .init(filters: filters))
    }
}

public enum ListPerformanceOverviewsForAppV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'deviceType'
        case deviceType([String])
    }
}
