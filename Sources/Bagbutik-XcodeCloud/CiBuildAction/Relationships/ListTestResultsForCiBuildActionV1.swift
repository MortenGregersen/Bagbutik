import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Test Results for an Xcode Cloud Test Action
     List all test results for a specific test action Xcode Cloud performed as part of a build.

     The example request below lists the test results for an Xcode Cloud build that performed a test action. Use the information provided in the response to display test results on a dashboard, create a new task for a failing test in your issue tracker, and so on.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildActions-_id_-testResults>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTestResultsForCiBuildActionV1(id: String,
                                                  fields: [ListTestResultsForCiBuildActionV1.Field]? = nil,
                                                  limit: Int? = nil) -> Request<CiTestResultsResponse, ErrorResponse>
    {
        .init(path: "/v1/ciBuildActions/\(id)/testResults", method: .get, parameters: .init(fields: fields,
                                                                                            limit: limit))
    }
}

public enum ListTestResultsForCiBuildActionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciTestResults
        case ciTestResults([CiTestResults])

        public enum CiTestResults: String, Sendable, ParameterValue, Codable, CaseIterable {
            case className
            case destinationTestResults
            case fileSource
            case message
            case name
            case status
        }
    }
}
