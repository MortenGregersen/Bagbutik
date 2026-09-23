import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Read test result information

     Get a specific test result Xcode Cloud created when it performed a build with a test action.

     ## Discussion

     The example request below retrieves result information for a test Xcode Cloud performed. Use the data provided in the response to display test result information on a dashboard, create reports, or create a new issue in your issue tracker for a failing test.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/ciTestResults/5ecb25ea-ce31-4b50-b88c-f1bf64c698ae
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "ciTestResults",
             "id": "5ecb25ea-ce31-4b50-b88c-f1bf64c698ae",
             "attributes": {
                 "className": "TestClass",
                 "name": "TestName",
                 "status": "SUCCESS",
                 "fileSource": null,
                 "message": null,
                 "destinationTestResults": [
                     {
                         "uuid": "e456c6a3-37a3-42c7-8299-33dad720f6b7",
                         "deviceName": "iPhone X",
                         "osVersion": "11.4.1",
                         "status": "SUCCESS",
                         "duration": 6.600471973
                     }
                 ]
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/ciTestResults/5ecb25ea-ce31-4b50-b88c-f1bf64c698ae"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciTestResults/5ecb25ea-ce31-4b50-b88c-f1bf64c698ae"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciTestResults-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiTestResultV1(id: String,
                                  fields: [GetCiTestResultV1.Field]? = nil) -> Request<CiTestResultResponse, ErrorResponse> {
        .init(
            path: "/v1/ciTestResults/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetCiTestResultV1 {
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
