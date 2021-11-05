public extension Request {
    /**
      # Read Xcode Cloud Issue Information
      Get information about a specific issue that occurred when Xcode Cloud performed a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_xcode_cloud_issue_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getCiIssue(id: String,
                           fields: [GetCiIssue.Field]? = nil) -> Request<CiIssueResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciIssues/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetCiIssue {
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
