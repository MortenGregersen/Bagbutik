import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # List all issues for a build action

     List all issues that occurred for a specific action that Xcode Cloud performed as part of a build.

     ## Discussion

     The example request below lists all issues Xcode Cloud encountered when it performed a build. Use the information provided in the response to display issue information on a dashboard, generate reports, automatically create tasks in your issue tracker, and so on.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/ciBuildActions/2488c5ec-ee0c-425e-902b-41c1e88208ca/issues
     ```

     **Response:**

     ```json
     {
     "data": [
             {
                 "type": "ciIssues",
                 "id": "b5ed3706-96e4-4111-be17-049fb365b72e",
                 "attributes": {
                     "issueType": "ERROR",
                     "message": "An example message.",
                     "fileSource": {
                         "path": "/path/to/the/file/that/contains/the/issue",
                         "lineNumber": 42
                     },
                     "category": null
                 },
                 "links": {
                     "self": "https://api.appstoreconnect.apple.com/v1/ciIssues/b5ed3706-96e4-4111-be17-049fb365b72e"
                 }
             }
         ],
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/2488c5ec-ee0c-425e-902b-41c1e88208ca/issues"
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
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildActions-_id_-issues>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listIssuesForCiBuildActionV1(id: String,
                                             fields: [ListIssuesForCiBuildActionV1.Field]? = nil,
                                             limit: Int? = nil) -> Request<CiIssuesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildActions/\(id)/issues",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListIssuesForCiBuildActionV1 {
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
