import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Read pull request information

     Get information about a specific pull request.

     ## Discussion

     The example request below retrieves information about a specific pull request. For example, use the data provided in the response to display pull request information on a custom dashboard.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/scmPullRequests/3372ba3b-013d-4328-9b48-0ef8ec54f48d
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "scmPullRequests",
             "id": "3372ba3b-013d-4328-9b48-0ef8ec54f48d",
             "attributes": {
                 "title": "A sample pull request",
                 "number": 123,
                 "webUrl": "https://github.com/example-user/example-app/pull/123",
                 "sourceRepositoryOwner": "example-user",
                 "sourceRepositoryName": "example-app",
                 "sourceBranchName": "BRANCH",
                 "destinationRepositoryOwner": "example-user",
                 "destinationRepositoryName": "example-app",
                 "destinationBranchName": "main",
                 "isClosed": false,
                 "isCrossRepository": false
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/scmPullRequests/3372ba3b-013d-4328-9b48-0ef8ec54f48d"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/scmPullRequests/3372ba3b-013d-4328-9b48-0ef8ec54f48d"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-scmPullRequests-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getScmPullRequestV1(id: String,
                                    fields: [GetScmPullRequestV1.Field]? = nil,
                                    includes: [GetScmPullRequestV1.Include]? = nil) -> Request<ScmPullRequestResponse, ErrorResponse> {
        .init(
            path: "/v1/scmPullRequests/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetScmPullRequestV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmPullRequests
        case scmPullRequests([ScmPullRequests])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

        public enum ScmPullRequests: String, Sendable, ParameterValue, Codable, CaseIterable {
            case destinationBranchName
            case destinationRepositoryName
            case destinationRepositoryOwner
            case isClosed
            case isCrossRepository
            case number
            case repository
            case sourceBranchName
            case sourceRepositoryName
            case sourceRepositoryOwner
            case title
            case webUrl

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmPullRequests(rawValue: string) {
                    self = value
                } else if let value = ScmPullRequests(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmPullRequests value: \(string)"
                    )
                }
            }
        }

        public enum ScmRepositories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case defaultBranch
            case gitReferences
            case httpCloneUrl
            case lastAccessedDate
            case ownerName
            case pullRequests
            case repositoryName
            case scmProvider
            case sshCloneUrl

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmRepositories(rawValue: string) {
                    self = value
                } else if let value = ScmRepositories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmRepositories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case repository
    }
}
