import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read report requests
     Read analytics report requests for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-analyticsReportRequests>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAnalyticsReportRequestsForAppV1(id: String,
                                                    fields: [ListAnalyticsReportRequestsForAppV1.Field]? = nil,
                                                    filters: [ListAnalyticsReportRequestsForAppV1.Filter]? = nil,
                                                    includes: [ListAnalyticsReportRequestsForAppV1.Include]? = nil,
                                                    limits: [ListAnalyticsReportRequestsForAppV1.Limit]? = nil) -> Request<AnalyticsReportRequestsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/analyticsReportRequests",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListAnalyticsReportRequestsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type analyticsReportRequests
        case analyticsReportRequests([AnalyticsReportRequests])
        /// The fields to include for returned resources of type analyticsReports
        case analyticsReports([AnalyticsReports])

        public enum AnalyticsReportRequests: String, Sendable, ParameterValue, Codable, CaseIterable {
            case accessType
            case reports
            case stoppedDueToInactivity
        }

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
        /// Filter by attribute 'accessType'
        case accessType([AccessType])

        public enum AccessType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case oneTimeSnapshot = "ONE_TIME_SNAPSHOT"
            case ongoing = "ONGOING"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case reports
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related reports returned (when they are included) - maximum 50
        case reports(Int)
    }
}
