public extension Request {
    /**
      # List All Primary Git Repositories for an Xcode Cloud Product
      List all primary Git repositories for a specific Xcode Cloud product.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_primary_git_repositories_for_an_xcode_cloud_product>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPrimaryRepositoriesForCiProduct(id: String,
                                                    fields: [ListPrimaryRepositoriesForCiProduct.Field]? = nil,
                                                    filters: [ListPrimaryRepositoriesForCiProduct.Filter]? = nil,
                                                    limit: Int? = nil) -> Request<ScmRepositoriesResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciProducts/\(id)/primaryRepositories", method: .get, parameters: .init(fields: fields,
                                                                                                       filters: filters,
                                                                                                       limit: limit))
    }
}

public enum ListPrimaryRepositoriesForCiProduct {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

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
}
