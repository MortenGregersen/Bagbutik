import BagbutikCore
import BagbutikReportingModels

public extension Request {
    /**
     # Read Report Requests

     Read analytics report requests for a specific app.

     ## Discussion

     ### Examples Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/apps/1476097583/analyticsReportRequests
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "analyticsReportRequests",
           "id": "d48c69c5-9bcb-4592-abbd-08a9411b0231",
           "attributes": {
             "accessType": "ONGOING",
             "stoppedDueToInactivity": false
           },
           "relationships": {
             "reports": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/reports",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231"
           }
         },
         {
           "type": "analyticsReportRequests",
           "id": "A157dd7a-4fe2-479b-8d25-a8e4228c5b81",
           "attributes": {
             "accessType": "ONE_TIME_SNAPSHOT",
             "stoppedDueToInactivity": false
           },
           "relationships": {
             "reports": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/A157dd7a-4fe2-479b-8d25-a8e4228c5b81/relationships/reports",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/A157dd7a-4fe2-479b-8d25-a8e4228c5b81/reports"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/A157dd7a-4fe2-479b-8d25-a8e4228c5b81"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/apps/389801252/analyticsReportRequests"
       },
       "meta": {
         "paging": {
           "total": 2,
           "limit": 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AnalyticsReportRequests(rawValue: string) {
                    self = value
                } else if let value = AnalyticsReportRequests(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AnalyticsReportRequests value: \(string)"
                    )
                }
            }
        }

        public enum AnalyticsReports: String, Sendable, ParameterValue, Codable, CaseIterable {
            case category
            case instances
            case name

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AnalyticsReports(rawValue: string) {
                    self = value
                } else if let value = AnalyticsReports(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AnalyticsReports value: \(string)"
                    )
                }
            }
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AccessType(rawValue: string) {
                    self = value
                } else if let value = AccessType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AccessType value: \(string)"
                    )
                }
            }
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
