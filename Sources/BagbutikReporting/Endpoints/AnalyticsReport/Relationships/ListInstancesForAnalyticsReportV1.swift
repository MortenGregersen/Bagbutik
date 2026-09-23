import BagbutikCore
import BagbutikModelsShared
import BagbutikReportingModels

public extension Request {
    /**
     # Read a List of Instances of a Report

     Read list of all the granularity options for a specific type of analytics report.

     ## Discussion

     ### Examples Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances?limit=3&filter%5Bgranularity%5D=DAILY
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "analyticsReportInstances",
           "id": "5c43f2fa-aae7-4290-8664-d6551784c508",
           "attributes": {
             "granularity": "DAILY",
             "processingDate": "2024-01-23"
           },
           "relationships": {
             "segments": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/5c43f2fa-aae7-4290-8664-d6551784c508/relationships/segments",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/5c43f2fa-aae7-4290-8664-d6551784c508/segments"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/5c43f2fa-aae7-4290-8664-d6551784c508"
           }
         },
         {
           "type": "analyticsReportInstances",
           "id": "42b3c667-3d79-47d0-8ee9-775f685a777c",
           "attributes": {
             "granularity": "DAILY",
             "processingDate": "2024-01-24"
           },
           "relationships": {
             "segments": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/42b3c667-3d79-47d0-8ee9-775f685a777c/relationships/segments",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/42b3c667-3d79-47d0-8ee9-775f685a777c/segments"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/42b3c667-3d79-47d0-8ee9-775f685a777c"
           }
         },
         {
           "type": "analyticsReportInstances",
           "id": "d4a141c8-7647-4bdf-b9ae-04cab705d641",
           "attributes": {
             "granularity": "DAILY",
             "processingDate": "2024-01-25"
           },
           "relationships": {
             "segments": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641/relationships/segments",
                 "related": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641/segments"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances?limit=3&filter%5Bgranularity%5D=DAILY",
         "next": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances?cursor=Aw.VGkW1w&limit=3&filter%5Bgranularity%5D=DAILY"
       },
       "meta": {
         "paging": {
           "total": 6,
           "limit": 3
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
