import BagbutikCore
import BagbutikModelsShared
import BagbutikReportingModels

public extension Request {
    /**
     # Read Reports for a Specific Request

     Get a list of reports generated from a specific analytics report request.

     ## Discussion

     ### Examples Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports?limit=5
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "analyticsReports",
           "id": "r19-d48c69c5-9bcb-4592-abbd-08a9411b0231",
           "attributes": {
             "name": "Streaming Playback Performance",
             "category": "PERFORMANCE"
           },
           "relationships": {
             "instances": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r19-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r19-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r19-d48c69c5-9bcb-4592-abbd-08a9411b0231"
           }
         },
         {
           "type": "analyticsReports",
           "id": "r20-d48c69c5-9bcb-4592-abbd-08a9411b0231",
           "attributes": {
             "name": "Streaming Downloads Performance",
             "category": "PERFORMANCE"
           },
           "relationships": {
             "instances": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r20-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r20-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r20-d48c69c5-9bcb-4592-abbd-08a9411b0231"
           }
         },
         {
           "type": "analyticsReports",
           "id": "r142-d48c69c5-9bcb-4592-abbd-08a9411b0231",
           "attributes": {
             "name": "App Crashes Expanded",
             "category": "PERFORMANCE"
           },
           "relationships": {
             "instances": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r142-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r142-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r142-d48c69c5-9bcb-4592-abbd-08a9411b0231"
           }
         },
         {
           "type": "analyticsReports",
           "id": "r143-d48c69c5-9bcb-4592-abbd-08a9411b0231",
           "attributes": {
             "name": "App Storage Reads and Writes",
             "category": "PERFORMANCE"
           },
           "relationships": {
             "instances": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r143-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r143-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r143-d48c69c5-9bcb-4592-abbd-08a9411b0231"
           }
         },
         {
           "type": "analyticsReports",
           "id": "r23-d48c69c5-9bcb-4592-abbd-08a9411b0231",
           "attributes": {
             "name": "AirPlay Performance",
             "category": "PERFORMANCE"
           },
           "relationships": {
             "instances": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r23-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r23-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r23-d48c69c5-9bcb-4592-abbd-08a9411b0231"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports?limit=5",
         "next": "https://api.appstoreconnect.apple.com/v1/analyticsReportRequests/d48c69c5-9bcb-4592-abbd-08a9411b0231/reports?cursor=BQ.ALHoGBE&limit=5"
       },
       "meta": {
         "paging": {
           "total": 116,
           "limit": 5
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsReportRequests-_id_-reports>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listReportsForAnalyticsReportRequestV1(id: String,
                                                       fields: [ListReportsForAnalyticsReportRequestV1.Field]? = nil,
                                                       filters: [ListReportsForAnalyticsReportRequestV1.Filter]? = nil,
                                                       limit: Int? = nil) -> Request<AnalyticsReportsResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReportRequests/\(id)/reports",
            method: .get,
            parameters: .init(
                fields: fields,
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Category(rawValue: string) {
                    self = value
                } else if let value = Category(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Category value: \(string)"
                    )
                }
            }
        }
    }
}
