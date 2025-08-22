import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read a list of instances of a report
     Read list of all the granularity options for a specific type of analytics report.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsReports-_id_-instances>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listInstancesForAnalyticsReportV1(id: String,
                                                  fields: [ListInstancesForAnalyticsReportV1.Field]? = nil,
                                                  filters: [ListInstancesForAnalyticsReportV1.Filter]? = nil,
                                                  limit: Int? = nil) -> Request<AnalyticsReportInstancesResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReports/\(id)/instances",
            method: .get,
            parameters: .init(
                fields: fields,
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

        public enum AnalyticsReportInstances: String, Sendable, ParameterValue, Codable, CaseIterable {
            case granularity
            case processingDate
            case segments

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AnalyticsReportInstances(rawValue: string) {
                    self = value
                } else if let value = AnalyticsReportInstances(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AnalyticsReportInstances value: \(string)"
                    )
                }
            }
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

        public enum Granularity: String, Sendable, ParameterValue, Codable, CaseIterable {
            case daily = "DAILY"
            case monthly = "MONTHLY"
            case weekly = "WEEKLY"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Granularity(rawValue: string) {
                    self = value
                } else if let value = Granularity(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Granularity value: \(string)"
                    )
                }
            }
        }
    }
}
