import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read report request information
     Get details for and the state of a specific analytics report request.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsReportRequests-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related reports returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAnalyticsReportRequestV1(id: String,
                                            fields: [GetAnalyticsReportRequestV1.Field]? = nil,
                                            includes: [GetAnalyticsReportRequestV1.Include]? = nil,
                                            limit: GetAnalyticsReportRequestV1.Limit? = nil) -> Request<AnalyticsReportRequestResponse, ErrorResponse>
    {
        .init(path: "/v1/analyticsReportRequests/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                         includes: includes,
                                                                                         limits: limit.map { [$0] }))
    }
}

public enum GetAnalyticsReportRequestV1 {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case reports
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related reports returned (when they are included) - maximum 50
        case reports(Int)
    }
}
