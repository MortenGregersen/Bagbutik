public extension Request {
    /**
     # List All Issues for a Build Action
     List all issues that occurred for a specific action that Xcode Cloud performed as part of a build.

     The example request below lists all issues Xcode Cloud encountered when it performed a build. Use the information provided in the response to display issue information on a dashboard, generate reports, automatically create tasks in your issue tracker, and so on.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_issues_for_a_build_action>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listIssuesForCiBuildActionV1(id: String,
                                             fields: [ListIssuesForCiBuildActionV1.Field]? = nil,
                                             limit: Int? = nil) -> Request<CiIssuesResponse, ErrorResponse>
    {
        .init(path: "/v1/ciBuildActions/\(id)/issues", method: .get, parameters: .init(fields: fields,
                                                                                       limit: limit))
    }
}

public enum ListIssuesForCiBuildActionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciIssues
        case ciIssues([CiIssues])

        public enum CiIssues: String, ParameterValue, CaseIterable {
            case category
            case fileSource
            case issueType
            case message
        }
    }
}
