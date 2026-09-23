import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Read xcode cloud issue information

     Get information about a specific issue that occurred when Xcode Cloud performed a build.

     ## Discussion

     The example request below retrieves information about a specific issue Xcode Cloud encountered when it performed a build. Use the information provided to display issues on a dashboard, create reports, and so on.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/ciIssues/61473b34-2ecd-498d-9e2b-94216b7e8fb4
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "ciIssues",
             "id": "61473b34-2ecd-498d-9e2b-94216b7e8fb4",
             "attributes": {
                 "issueType": "ERROR",
                 "message": "A message describing the issue.",
                 "fileSource": {
                     "path": "/the/path/to/the/file/with/the/issue",
                     "lineNumber": 42
                 },
                 "category": null
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/ciIssues/61473b34-2ecd-498d-9e2b-94216b7e8fb4"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciIssues/61473b34-2ecd-498d-9e2b-94216b7e8fb4"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciIssues-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiIssueV1(id: String,
                             fields: [GetCiIssueV1.Field]? = nil) -> Request<CiIssueResponse, ErrorResponse> {
        .init(
            path: "/v1/ciIssues/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetCiIssueV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciIssues
        case ciIssues([CiIssues])

        public enum CiIssues: String, Sendable, ParameterValue, Codable, CaseIterable {
            case category
            case fileSource
            case issueType
            case message

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiIssues(rawValue: string) {
                    self = value
                } else if let value = CiIssues(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiIssues value: \(string)"
                    )
                }
            }
        }
    }
}
