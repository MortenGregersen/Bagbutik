public extension Request {
    /**
      # List All Pull Requests for a Repository
      List all pull requests for a specific repository that Xcode Cloud can access.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_pull_requests_for_a_repository>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPullRequestsForScmRepositoryV1(id: String,
                                                   fields: [ListPullRequestsForScmRepositoryV1.Field]? = nil,
                                                   includes: [ListPullRequestsForScmRepositoryV1.Include]? = nil,
                                                   limit: Int? = nil) -> Request<ScmPullRequestsResponse, ErrorResponse>
    {
        return .init(path: "/v1/scmRepositories/\(id)/pullRequests", method: .get, parameters: .init(fields: fields,
                                                                                                     includes: includes,
                                                                                                     limit: limit))
    }
}

public enum ListPullRequestsForScmRepositoryV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmPullRequests
        case scmPullRequests([ScmPullRequests])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

        public enum ScmPullRequests: String, ParameterValue, CaseIterable {
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
        }

        public enum ScmRepositories: String, ParameterValue, CaseIterable {
            case defaultBranch
            case gitReferences
            case httpCloneUrl
            case lastAccessedDate
            case ownerName
            case pullRequests
            case repositoryName
            case scmProvider
            case sshCloneUrl
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case repository
    }
}
