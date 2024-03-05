import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the details for a report segment
     Get details and download information for a specific analytics report segment.

     To learn more about interpreting the data using the glossary of report fields and definitions, see [Analytics Reports](https://developer.apple.com/documentation/analytics-reports).

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_details_for_a_report_segment>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAnalyticsReportSegmentV1(id: String,
                                            fields: [GetAnalyticsReportSegmentV1.Field]? = nil) -> Request<AnalyticsReportSegmentResponse, ErrorResponse>
    {
        .init(path: "/v1/analyticsReportSegments/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAnalyticsReportSegmentV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type analyticsReportSegments
        case analyticsReportSegments([AnalyticsReportSegments])

        public enum AnalyticsReportSegments: String, ParameterValue, Codable, CaseIterable {
            case checksum
            case sizeInBytes
            case url
        }
    }
}
