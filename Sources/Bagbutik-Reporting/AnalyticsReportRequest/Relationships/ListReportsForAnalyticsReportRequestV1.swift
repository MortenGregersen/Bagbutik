import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read reports for a specific request
     Get a list of reports generated from a specific analytics report request.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_reports_for_a_specific_request>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listReportsForAnalyticsReportRequestV1(id: String,
                                                       fields: [ListReportsForAnalyticsReportRequestV1.Field]? = nil,
                                                       filters: [ListReportsForAnalyticsReportRequestV1.Filter]? = nil,
                                                       limit: Int? = nil) -> Request<AnalyticsReportsResponse, ErrorResponse>
    {
        .init(path: "/v1/analyticsReportRequests/\(id)/reports", method: .get, parameters: .init(fields: fields,
                                                                                                 filters: filters,
                                                                                                 limit: limit))
    }
}

public enum ListReportsForAnalyticsReportRequestV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type analyticsReports
        case analyticsReports([AnalyticsReports])

        public enum AnalyticsReports: String, Sendable, ParameterValue, Codable, CaseIterable {
            case category
            case instances
            case name
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'category'
        case category([Category])
        /// Filter by attribute 'name'
        case name([String])

        public enum Category: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreEngagement = "APP_STORE_ENGAGEMENT"
            case appUsage = "APP_USAGE"
            case commerce = "COMMERCE"
            case frameworkUsage = "FRAMEWORK_USAGE"
            case performance = "PERFORMANCE"
        }
    }
}
