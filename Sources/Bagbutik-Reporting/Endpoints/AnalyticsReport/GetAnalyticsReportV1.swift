import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read report information
     Get details for a specific analytics report.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsReports-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAnalyticsReportV1(id: String,
                                     fields: [GetAnalyticsReportV1.Field]? = nil) -> Request<AnalyticsReportResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReports/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAnalyticsReportV1 {
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
}
