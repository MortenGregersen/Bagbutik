import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read beta feedback crash submission information
     Get information for a specific beta feedback crash submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaFeedbackCrashSubmissions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaFeedbackCrashSubmissionV1(id: String,
                                                 fields: [GetBetaFeedbackCrashSubmissionV1.Field]? = nil,
                                                 includes: [GetBetaFeedbackCrashSubmissionV1.Include]? = nil) -> Request<BetaFeedbackCrashSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/betaFeedbackCrashSubmissions/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBetaFeedbackCrashSubmissionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaFeedbackCrashSubmissions
        case betaFeedbackCrashSubmissions([BetaFeedbackCrashSubmissions])

        public enum BetaFeedbackCrashSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPlatform
            case appUptimeInMilliseconds
            case architecture
            case batteryPercentage
            case build
            case buildBundleId
            case comment
            case connectionType
            case crashLog
            case createdDate
            case deviceFamily
            case deviceModel
            case devicePlatform
            case diskBytesAvailable
            case diskBytesTotal
            case email
            case locale
            case osVersion
            case pairedAppleWatch
            case screenHeightInPoints
            case screenWidthInPoints
            case tester
            case timeZone

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaFeedbackCrashSubmissions(rawValue: string) {
                    self = value
                } else if let value = BetaFeedbackCrashSubmissions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaFeedbackCrashSubmissions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case build
        case tester
    }
}
