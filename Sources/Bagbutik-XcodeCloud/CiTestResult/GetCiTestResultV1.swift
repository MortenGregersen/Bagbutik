import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Test Result Information
     Get a specific test result Xcode Cloud created when it performed a build with a test action.

     The example request below retrieves result information for a test Xcode Cloud performed. Use the data provided in the response to display test result information on a dashboard, create reports, or create a new issue in your issue tracker for a failing test.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_test_result_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiTestResultV1(id: String,
                                  fields: [GetCiTestResultV1.Field]? = nil) -> Request<CiTestResultResponse, ErrorResponse>
    {
        .init(path: "/v1/ciTestResults/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetCiTestResultV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciTestResults
        case ciTestResults([CiTestResults])

        public enum CiTestResults: String, ParameterValue, Codable, CaseIterable {
            case className
            case destinationTestResults
            case fileSource
            case message
            case name
            case status
        }
    }
}
