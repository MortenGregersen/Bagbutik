public extension Request {
    /**
      # Read Xcode Cloud Issue Information
      Get information about a specific issue that occurred when Xcode Cloud performed a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_xcode_cloud_issue_information>

      The example request below retrieves information about a specific issue Xcode Cloud encountered when it performed a build. Use the information provided to display issues on a dashboard, create reports, and so on.

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getCiIssueV1(id: String,
                             fields: [GetCiIssueV1.Field]? = nil) -> Request<CiIssueResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciIssues/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetCiIssueV1 {
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
