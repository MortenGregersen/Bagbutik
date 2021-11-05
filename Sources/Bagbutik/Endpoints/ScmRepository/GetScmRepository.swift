public extension Request {
    /**
      # Read Git Repository Information
      Get information about a Git repository that Xcode Cloud can access.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_git_repository_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getScmRepository(id: String,
                                 fields: [GetScmRepository.Field]? = nil,
                                 includes: [GetScmRepository.Include]? = nil) -> Request<ScmRepositoryResponse, ErrorResponse>
    {
        return .init(path: "/v1/scmRepositories/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes))
    }
}

public enum GetScmRepository {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmGitReferences
        case scmGitReferences([ScmGitReferences])
        /// The fields to include for returned resources of type scmPullRequests
        case scmPullRequests([ScmPullRequests])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

        public enum ScmGitReferences: String, ParameterValue, CaseIterable {
            case canonicalName
            case isDeleted
            case kind
            case name
            case repository
        }

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
        case defaultBranch, scmProvider
    }
}
