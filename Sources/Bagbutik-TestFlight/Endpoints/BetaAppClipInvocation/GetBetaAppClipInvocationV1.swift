import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Beta App Clip Invocation Information
     Get a specific App Clip invocation you configure for testing.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaAppClipInvocations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related betaAppClipInvocationLocalizations returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaAppClipInvocationV1(id: String,
                                           fields: [GetBetaAppClipInvocationV1.Field]? = nil,
                                           includes: [GetBetaAppClipInvocationV1.Include]? = nil,
                                           limit: GetBetaAppClipInvocationV1.Limit? = nil) -> Request<BetaAppClipInvocationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppClipInvocations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetBetaAppClipInvocationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppClipInvocations
        case betaAppClipInvocations([BetaAppClipInvocations])

        public enum BetaAppClipInvocations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case betaAppClipInvocationLocalizations
            case url

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaAppClipInvocations(rawValue: string) {
                    self = value
                } else if let value = BetaAppClipInvocations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaAppClipInvocations value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case betaAppClipInvocationLocalizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related betaAppClipInvocationLocalizations returned (when they are included) - maximum 50
        case betaAppClipInvocationLocalizations(Int)
    }
}
