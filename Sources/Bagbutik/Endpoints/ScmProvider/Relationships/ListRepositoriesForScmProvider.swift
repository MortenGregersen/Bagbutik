public extension Request {
    /**
      # List all Repositories for a Source Code Management Provider
      List all Git repositories for a specific source code management provider you connected to Xcode Cloud.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_repositories_for_a_source_code_management_provider>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listRepositoriesForScmProvider(id: String,
                                               fields: [ListRepositoriesForScmProvider.Field]? = nil,
                                               filters: [ListRepositoriesForScmProvider.Filter]? = nil,
                                               includes: [ListRepositoriesForScmProvider.Include]? = nil,
                                               limit: Int? = nil) -> Request<ScmRepositoriesResponse, ErrorResponse>
    {
        return .init(path: "/v1/scmProviders/\(id)/repositories", method: .get, parameters: .init(fields: fields,
                                                                                                  filters: filters,
                                                                                                  includes: includes,
                                                                                                  limit: limit))
    }
}

public enum ListRepositoriesForScmProvider {
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

        public enum ScmGitReferences: String, ParameterValue, CaseIterable {
            case canonicalName
            case isDeleted
            case kind
            case name
            case repository
        }

        public enum ScmProviders: String, ParameterValue, CaseIterable {
            case repositories
            case scmProviderType
            case url
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s)
        case id([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case defaultBranch, scmProvider
    }
}
