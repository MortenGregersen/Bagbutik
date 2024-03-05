import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the segments for a report
     Get details for a specific analytics report segment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_segments_for_a_report>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSegmentsForAnalyticsReportInstanceV1(id: String,
                                                         fields: [ListSegmentsForAnalyticsReportInstanceV1.Field]? = nil,
                                                         limit: Int? = nil) -> Request<AnalyticsReportSegmentsResponse, ErrorResponse>
    {
        .init(path: "/v1/analyticsReportInstances/\(id)/segments", method: .get, parameters: .init(fields: fields,
                                                                                                   limit: limit))
    }
}

public enum ListSegmentsForAnalyticsReportInstanceV1 {
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
