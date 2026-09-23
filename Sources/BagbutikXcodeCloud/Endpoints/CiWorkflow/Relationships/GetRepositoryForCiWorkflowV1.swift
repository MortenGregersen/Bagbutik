import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Read the repository information for an xcode cloud workflow

     Get information about the Git repository of a specific Xcode Cloud workflow.

     ## Discussion

     The example request below retrieves information about an Xcode Cloud workflow’s repository. Use the data provided in the response to read additional information; for example, pull request information.

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/ciWorkflows/3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f/repository
     ```

     **Response:**

     ```json
     {
         "data": {
           "type": "scmRepositories",
           "id": "a2b04ba9-85fa-478c-87a2-b6d19626b870",
           "attributes": {
             "lastAccessedDate": null,
             "httpCloneUrl": "https://github.com/foo/bar.git",
             "sshCloneUrl": "ssh://git@github.com/foo/bar.git",
             "ownerName": "foo",
             "repositoryName": "bar"
           },
           "relationships": {
             "gitReferences": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/scmRepositories/a2b04ba9-85fa-478c-87a2-b6d19626b870/relationships/gitReferences",
                 "related": "https://api.appstoreconnect.apple.com/v1/scmRepositories/a2b04ba9-85fa-478c-87a2-b6d19626b870/gitReferences"
               }
             },
             "pullRequests": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/scmRepositories/a2b04ba9-85fa-478c-87a2-b6d19626b870/relationships/pullRequests",
                 "related": "https://api.appstoreconnect.apple.com/v1/scmRepositories/a2b04ba9-85fa-478c-87a2-b6d19626b870/pullRequests"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/scmRepositories/a2b04ba9-85fa-478c-87a2-b6d19626b870"
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/scmRepositories/a2b04ba9-85fa-478c-87a2-b6d19626b870"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciWorkflows-_id_-repository>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRepositoryForCiWorkflowV1(id: String,
                                             fields: [GetRepositoryForCiWorkflowV1.Field]? = nil,
                                             includes: [GetRepositoryForCiWorkflowV1.Include]? = nil) -> Request<ScmRepositoryResponse, ErrorResponse> {
        .init(
            path: "/v1/ciWorkflows/\(id)/repository",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetRepositoryForCiWorkflowV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmGitReferences
        case scmGitReferences([ScmGitReferences])
        /// The fields to include for returned resources of type scmProviders
        case scmProviders([ScmProviders])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

        public enum ScmGitReferences: String, Sendable, ParameterValue, Codable, CaseIterable {
            case canonicalName
            case isDeleted
            case kind
            case name
            case repository

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmGitReferences(rawValue: string) {
                    self = value
                } else if let value = ScmGitReferences(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmGitReferences value: \(string)"
                    )
                }
            }
        }

        public enum ScmProviders: String, Sendable, ParameterValue, Codable, CaseIterable {
            case repositories
            case scmProviderType
            case url

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmProviders(rawValue: string) {
                    self = value
                } else if let value = ScmProviders(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmProviders value: \(string)"
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
        case defaultBranch
        case scmProvider
    }
}
