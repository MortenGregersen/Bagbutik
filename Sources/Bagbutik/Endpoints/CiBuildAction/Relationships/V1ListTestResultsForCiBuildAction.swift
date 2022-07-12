public extension Request {
    /**
      # List All Test Results for an Xcode Cloud Test Action
      List all test results for a specific test action Xcode Cloud performed as part of a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_test_results_for_an_xcode_cloud_test_action>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listTestResultsForCiBuildActionV1(id: String,
                                                  fields: [ListTestResultsForCiBuildActionV1.Field]? = nil,
                                                  limit: Int? = nil) -> Request<CiTestResultsResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciBuildActions/\(id)/testResults", method: .get, parameters: .init(fields: fields,
                                                                                                   limit: limit))
    }
}

public enum V1ListTestResultsForCiBuildAction {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciTestResults
        case ciTestResults([CiTestResults])

        public enum CiTestResults: String, ParameterValue, CaseIterable {
            case className
            case destinationTestResults
            case fileSource
            case message
            case name
            case status
        }
    }
}
