import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Additional Repositories for an Xcode Cloud Product
     List all additional Git repositories you associated with an Xcode Cloud product.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_additional_repositories_for_an_xcode_cloud_product>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAdditionalRepositoriesForCiProductV1(id: String,
                                                         fields: [ListAdditionalRepositoriesForCiProductV1.Field]? = nil,
                                                         filters: [ListAdditionalRepositoriesForCiProductV1.Filter]? = nil,
                                                         includes: [ListAdditionalRepositoriesForCiProductV1.Include]? = nil,
                                                         limit: Int? = nil) -> Request<ScmRepositoriesResponse, ErrorResponse>
    {
        .init(path: "/v1/ciProducts/\(id)/additionalRepositories", method: .get, parameters: .init(fields: fields,
                                                                                                   filters: filters,
                                                                                                   includes: includes,
                                                                                                   limit: limit))
    }
}

public enum ListAdditionalRepositoriesForCiProductV1 {
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
        case defaultBranch
        case scmProvider
    }
}
