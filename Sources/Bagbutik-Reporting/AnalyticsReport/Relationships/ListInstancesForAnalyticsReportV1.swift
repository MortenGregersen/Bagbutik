import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read a list of instances of a report
     Read list of all the granularity options for a specific type of analytics report.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_a_list_of_instances_of_a_report>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listInstancesForAnalyticsReportV1(id: String,
                                                  fields: [ListInstancesForAnalyticsReportV1.Field]? = nil,
                                                  filters: [ListInstancesForAnalyticsReportV1.Filter]? = nil,
                                                  limit: Int? = nil) -> Request<AnalyticsReportInstancesResponse, ErrorResponse>
    {
        .init(path: "/v1/analyticsReports/\(id)/instances", method: .get, parameters: .init(fields: fields,
                                                                                            filters: filters,
                                                                                            limit: limit))
    }
}

public enum ListInstancesForAnalyticsReportV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type analyticsReportInstances
        case analyticsReportInstances([AnalyticsReportInstances])

        public enum AnalyticsReportInstances: String, ParameterValue, Codable, CaseIterable {
            case granularity
            case processingDate
            case segments
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'granularity'
        case granularity([Granularity])
        /// Filter by attribute 'processingDate'
        case processingDate([String])

        public enum Granularity: String, ParameterValue, Codable, CaseIterable {
            case daily = "DAILY"
            case monthly = "MONTHLY"
            case weekly = "WEEKLY"
        }
    }
}
