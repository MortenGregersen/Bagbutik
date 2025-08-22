import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read beta crash log information
     Get crash log details for a specific beta feedback crash submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaCrashLogs-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaCrashLogV1(id: String,
                                  fields: [GetBetaCrashLogV1.Field]? = nil) -> Request<BetaCrashLogResponse, ErrorResponse> {
        .init(
            path: "/v1/betaCrashLogs/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBetaCrashLogV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaCrashLogs
        case betaCrashLogs([BetaCrashLogs])

        public enum BetaCrashLogs: String, Sendable, ParameterValue, Codable, CaseIterable {
            case logText

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaCrashLogs(rawValue: string) {
                    self = value
                } else if let value = BetaCrashLogs(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaCrashLogs value: \(string)"
                    )
                }
            }
        }
    }
}
