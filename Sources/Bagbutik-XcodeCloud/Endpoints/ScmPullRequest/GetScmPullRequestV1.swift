import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Pull Request Information
     Get information about a specific pull request.

     The example request below retrieves information about a specific pull request. For example, use the data provided in the response to display pull request information on a custom dashboard.

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
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case repository
    }
}
