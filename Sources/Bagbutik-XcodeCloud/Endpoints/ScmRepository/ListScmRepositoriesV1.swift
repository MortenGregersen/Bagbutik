import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Git Repositories
     List all Git repositories Xcode Cloud can access.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-scmRepositories>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listScmRepositoriesV1(fields: [ListScmRepositoriesV1.Field]? = nil,
                                      filters: [ListScmRepositoriesV1.Filter]? = nil,
                                      includes: [ListScmRepositoriesV1.Include]? = nil,
                                      limit: Int? = nil) -> Request<ScmRepositoriesResponse, ErrorResponse> {
        .init(
            path: "/v1/scmRepositories",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListScmRepositoriesV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

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
    public enum Include: String, IncludeParameter, CaseIterable {
        case defaultBranch
        case scmProvider
    }
}
