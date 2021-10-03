public extension Request {
    /**
      # List All Actions for an Xcode Cloud Build
      List all actions Xcode Cloud performed during a specific build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_actions_for_an_xcode_cloud_build>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listActionsForCiBuildRun(id: String,
                                         fields: [ListActionsForCiBuildRun.Field]? = nil,
                                         limit: Int? = nil) -> Request<CiBuildActionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciBuildRuns/\(id)/actions", method: .get, parameters: .init(fields: fields,
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
    }
}
