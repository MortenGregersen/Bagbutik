import BagbutikCore
import BagbutikReportingModels

public extension Request {
    /**
     # Read the Details for a Report Segment

     Get details and download information for a specific analytics report segment.

     ## Discussion

     To learn more about interpreting the data using the glossary of report fields and definitions, see <doc://com.apple.documentation/documentation/analytics-reports>.

     ### Examples Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/analyticsReportSegments/503110d4-0fa2-41c0-9d41-ab7c7dac683f
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "analyticsReportSegments",
         "id": "503110d4-0fa2-41c0-9d41-ab7c7dac683f",
         "attributes": {
           "checksum": "3817152bb13cb70f615d9bb3899aaba6",
           "sizeInBytes": 156,
           "url": "https://asp-qa-us-west-2.s3.us-west-2.amazonaws.com/reports/389801252/APP_CRASHES_PRIMARY/DAILY/ONGOING/20240125/1707515196512/0.csv.gz?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGgaCXVzLXdlc3QtMiJIMEYCIQDeFnB%2B7UL2CsdboFmIXHoikVs3VyOVaTOJr0sfMkM2sAIhAM2jsmRPkxi1ZfY4F1rX%2Bzh5AQIODkr1AZbTsl5BCMHhKqICCFEQARoMNjEwNDgzMzUxMzUwIgzfxJlERt4K4Em4Hp8q%2FwHPjAxuT28WVnqXiR%2Fekc1WqV%2B6FgUJiWefx5%2FilyLIF%2FSeQ%2F%2Boav%2F9xdgPymjnX9nHs6T%2FKNxESQaEclt9JLvoSNwRKPIFxEXGDpiSTNzRNKdPtp6KngfX2N6Eu8O7IxVl%2BsZ8Vt8jRYJEbpi2dzP2xqqBtvhQUSdP4HI4HIeVETU67tIDb61oATqKzk6kS1%2B3HkVVHsOYTG9wLzYegwBKOel0QkgslVx9AzuzyFsYt9z8ZPmsjssElrbFswUODqEHRK4FmOxlmkXSyLuKNLT0YgFGIS85%2BHxZrocrAJp1dgK5vlzmioVPx7t1O4qwQI5JyALx1Y9K1G1hxkUzlqcwrqLargY6nAHeG%2BXoJLrLG6RWyvnWDbU9sWUEWCX6WCNxU%2Bd%2BHdyngLd6%2FkFpB8fDBMQpQMvIuDO%2FTXGs%2F39Day4vZyNyIZCsxdP7coYejv7HJed48tGoEqbLWs6WdArcx6xnCGyXyYbWU1mkP%2BG5gkSxx0sQqxeQYoQfbFwpARuNZqpXoFoZUAj1GIEx1DxOOYKcj5LzImG5HFHpvXPqrTEtG0E%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240222T001357Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAY4I5EV43MJZFZNQ4%2F20240222%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Signature=154891050ae75408fbe44d6c44927c3048820b1975014c88ea9418750cba1ee7"
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportSegments/503110d4-0fa2-41c0-9d41-ab7c7dac683f"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/analyticsReportSegments/503110d4-0fa2-41c0-9d41-ab7c7dac683f"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-analyticsReportSegments-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAnalyticsReportSegmentV1(id: String,
                                            fields: [GetAnalyticsReportSegmentV1.Field]? = nil) -> Request<AnalyticsReportSegmentResponse, ErrorResponse> {
        .init(
            path: "/v1/analyticsReportSegments/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAnalyticsReportSegmentV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type analyticsReportSegments
        case analyticsReportSegments([AnalyticsReportSegments])

        public enum AnalyticsReportSegments: String, Sendable, ParameterValue, Codable, CaseIterable {
            case checksum
            case sizeInBytes
            case url

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AnalyticsReportSegments(rawValue: string) {
                    self = value
                } else if let value = AnalyticsReportSegments(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AnalyticsReportSegments value: \(string)"
                    )
                }
            }
        }
    }
}
