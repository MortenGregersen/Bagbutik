import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Git Repository Information
     Get information about a Git repository that Xcode Cloud can access.

     The example request below retrieves information about a specific Git repository that Xcode Cloud can access. Use the data provided in the response to read additional information; for example, pull request information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-scmRepositories-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getScmRepositoryV1(id: String,
                                   fields: [GetScmRepositoryV1.Field]? = nil,
                                   includes: [GetScmRepositoryV1.Include]? = nil) -> Request<ScmRepositoryResponse, ErrorResponse> {
        .init(
            path: "/v1/scmRepositories/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetScmRepositoryV1 {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case defaultBranch
        case scmProvider
    }
}
