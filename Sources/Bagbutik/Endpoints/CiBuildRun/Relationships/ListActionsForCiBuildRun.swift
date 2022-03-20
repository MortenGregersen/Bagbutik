public extension Request {
    /**
      # List All Actions for an Xcode Cloud Build
      List all actions Xcode Cloud performed during a specific build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_actions_for_an_xcode_cloud_build>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listActionsForCiBuildRun(id: String,
                                         fields: [ListActionsForCiBuildRun.Field]? = nil,
                                         includes: [ListActionsForCiBuildRun.Include]? = nil,
                                         limit: Int? = nil) -> Request<CiBuildActionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciBuildRuns/\(id)/actions", method: .get, parameters: .init(fields: fields,
                                                                                            includes: includes,
                                                                                            limit: limit))
    }
}

public enum ListActionsForCiBuildRun {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciBuildActions
        case ciBuildActions([CiBuildActions])
        /// The fields to include for returned resources of type ciBuildRuns
        case ciBuildRuns([CiBuildRuns])

        public enum CiBuildActions: String, ParameterValue, CaseIterable {
            case actionType
            case artifacts
            case buildRun
            case completionStatus
            case executionProgress
            case finishedDate
            case isRequiredToPass
            case issueCounts
            case issues
            case name
            case startedDate
            case testResults
        }

        public enum CiBuildRuns: String, ParameterValue, CaseIterable {
            case actions
            case buildRun
            case builds
            case cancelReason
            case clean
            case completionStatus
            case createdDate
            case destinationBranch
            case destinationCommit
            case executionProgress
            case finishedDate
            case isPullRequestBuild
            case issueCounts
            case number
            case product
            case pullRequest
            case sourceBranchOrTag
            case sourceCommit
            case startReason
            case startedDate
            case workflow
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case buildRun
    }
}
