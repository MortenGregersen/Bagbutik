public extension Request {
    /**
      # Read Test Result Information
      Get a specific test result Xcode Cloud created when it performed a build with a test action.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_test_result_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getCiTestResult(id: String,
                                fields: [GetCiTestResult.Field]? = nil) -> Request<CiTestResultResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciTestResults/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetCiTestResult {
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
