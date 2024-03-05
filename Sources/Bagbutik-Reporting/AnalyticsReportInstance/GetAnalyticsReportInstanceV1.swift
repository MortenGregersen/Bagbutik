import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read report instance information
     Get details for a specific instance of an analytics report.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_report_instance_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAnalyticsReportInstanceV1(id: String,
                                             fields: [GetAnalyticsReportInstanceV1.Field]? = nil) -> Request<AnalyticsReportInstanceResponse, ErrorResponse>
    {
        .init(path: "/v1/analyticsReportInstances/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAnalyticsReportInstanceV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type analyticsReportInstances
        case analyticsReportInstances([AnalyticsReportInstances])
        /// The fields to include for returned resources of type analyticsReportSegments
        case analyticsReportSegments([AnalyticsReportSegments])

        public enum AnalyticsReportInstances: String, ParameterValue, Codable, CaseIterable {
            case granularity
            case processingDate
            case segments
        }

        public enum AnalyticsReportSegments: String, ParameterValue, Codable, CaseIterable {
            case checksum
            case sizeInBytes
            case url
        }
    }
}
