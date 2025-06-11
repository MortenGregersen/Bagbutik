import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the crash log for a beta feedback crash submission
     Get crash log information for a specific beta feedback crash submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaFeedbackCrashSubmissions-_id_-crashLog>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCrashLogForBetaFeedbackCrashSubmissionV1(id: String,
                                                            fields: [GetCrashLogForBetaFeedbackCrashSubmissionV1.Field]? = nil) -> Request<BetaCrashLogResponse, ErrorResponse> {
        .init(
            path: "/v1/betaFeedbackCrashSubmissions/\(id)/crashLog",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetCrashLogForBetaFeedbackCrashSubmissionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaCrashLogs
        case betaCrashLogs([BetaCrashLogs])

        public enum BetaCrashLogs: String, Sendable, ParameterValue, Codable, CaseIterable {
            case logText
        }
    }
}
