import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Beta App Clip Invocations for a Build Bundle
     Get all App Clip invocations you configure for testing for a specific build bundle.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildBundles-_id_-betaAppClipInvocations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaAppClipInvocationsForBuildBundleV1(id: String,
                                                           fields: [ListBetaAppClipInvocationsForBuildBundleV1.Field]? = nil,
                                                           includes: [ListBetaAppClipInvocationsForBuildBundleV1.Include]? = nil,
                                                           limits: [ListBetaAppClipInvocationsForBuildBundleV1.Limit]? = nil) -> Request<BetaAppClipInvocationsResponse, ErrorResponse> {
        .init(
            path: "/v1/buildBundles/\(id)/betaAppClipInvocations",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum ListBetaAppClipInvocationsForBuildBundleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppClipInvocationLocalizations
        case betaAppClipInvocationLocalizations([BetaAppClipInvocationLocalizations])
        /// The fields to include for returned resources of type betaAppClipInvocations
        case betaAppClipInvocations([BetaAppClipInvocations])

        public enum BetaAppClipInvocationLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case locale
            case title

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaAppClipInvocationLocalizations(rawValue: string) {
                    self = value
                } else if let value = BetaAppClipInvocationLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaAppClipInvocationLocalizations value: \(string)"
                    )
                }
            }
        }

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
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
