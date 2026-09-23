import BagbutikCore
import BagbutikReportingModels

public extension Request {
    /**
     # Read Report Information

     Get details for a specific analytics report.

     ## Discussion

     ### Examples Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "analyticsReports",
         "id": "r2-d48c69c5-9bcb-4592-abbd-08a9411b0231",
         "attributes": {
           "name": "App Crashes",
           "category": "APP_USAGE"
         },
         "relationships": {
           "instances": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/relationships/instances",
               "related": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231/instances"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/analyticsReports/r2-d48c69c5-9bcb-4592-abbd-08a9411b0231"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
}
