import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # List all test results for an xcode cloud test action

     List all test results for a specific test action Xcode Cloud performed as part of a build.

     ## Discussion

     The example request below lists the test results for an Xcode Cloud build that performed a test action. Use the information provided in the response to display test results on a dashboard, create a new task for a failing test in your issue tracker, and so on.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/ciBuildActions/d871dabb-2c2c-4012-aff5-abb427bcb3a3/testResults
     ```

     **Response:**

     ```json
     {
     "data": [
             {
                 "type": "ciTestResults",
                 "id": "87f8a597-bea9-49d8-ba8b-6a643de66903",
                 "attributes": {
                     "className": "TestClass",
                     "name": "TestName",
                     "status": "SUCCESS",
                     "fileSource": {
                         "path": "path",
                         "lineNumber": 100
                     },
                     "message": null,
                     "destinationTestResults": [
                         {
                             "uuid": "8d1bff05-2b9c-4cc4-9225-e2cd41dee260",
                             "deviceName": "iPhone X",
                             "osVersion": "11.4.1",
                             "status": "SUCCESS",
                             "duration": 6.600471973
                         }
                     ]
                 },
                 "links": {
                     "self": "https://api.appstoreconnect.apple.com/v1/ciTestResults/87f8a597-bea9-49d8-ba8b-6a643de66903"
                 }
             }
         ],
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/d871dabb-2c2c-4012-aff5-abb427bcb3a3/testResults"
         },
         "meta": {
             "paging": {
                 "limit": 50
             }
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildActions-_id_-testResults>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTestResultsForCiBuildActionV1(id: String,
                                                  fields: [ListTestResultsForCiBuildActionV1.Field]? = nil,
                                                  limit: Int? = nil) -> Request<CiTestResultsResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildActions/\(id)/testResults",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListTestResultsForCiBuildActionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciTestResults
        case ciTestResults([CiTestResults])

        public enum CiTestResults: String, Sendable, ParameterValue, Codable, CaseIterable {
            case className
            case destinationTestResults
            case fileSource
            case message
            case name
            case status

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiTestResults(rawValue: string) {
                    self = value
                } else if let value = CiTestResults(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiTestResults value: \(string)"
                    )
                }
            }
        }
    }
}
