import BagbutikCore
import BagbutikReportingModels

public extension Request {
    /**
     # Read Report Instance Information

     Get details for a specific instance of an analytics report.

     ## Discussion

     > Note:
     > If you don’t retrieve data for a long time, a report request changes to `stoppedDueToInactivity`. You need to make a new request to resume getting reports.

     ### Examples Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641
     ```

     **Response:**

     ```json
     {
       "data": {
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
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportInstances/d4a141c8-7647-4bdf-b9ae-04cab705d641"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsReportInstances-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAnalyticsReportInstanceV1(id: String,
                                             fields: [GetAnalyticsReportInstanceV1.Field]? = nil) -> Request<AnalyticsReportInstanceResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReportInstances/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAnalyticsReportInstanceV1 {
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
}
