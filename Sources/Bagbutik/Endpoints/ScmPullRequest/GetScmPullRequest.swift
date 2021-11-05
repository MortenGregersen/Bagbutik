public extension Request {
    /**
      # Read Pull Request Information
      Get information about a specific pull request.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_pull_request_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getScmPullRequest(id: String,
                                  fields: [GetScmPullRequest.Field]? = nil,
                                  includes: [GetScmPullRequest.Include]? = nil) -> Request<ScmPullRequestResponse, ErrorResponse>
    {
        return .init(path: "/v1/scmPullRequests/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes))
    }
}

public enum GetScmPullRequest {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmPullRequests
        case scmPullRequests([ScmPullRequests])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case repository
    }
}
