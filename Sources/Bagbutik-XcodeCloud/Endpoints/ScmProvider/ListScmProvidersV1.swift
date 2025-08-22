import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Source Code Management Providers
     List all source code management providers you connected to Xcode Cloud.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-scmProviders>

     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listScmProvidersV1(fields: [ListScmProvidersV1.Field]? = nil,
                                   limit: Int? = nil) -> Request<ScmProvidersResponse, ErrorResponse> {
        .init(
            path: "/v1/scmProviders",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListScmProvidersV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmProviders
        case scmProviders([ScmProviders])

        public enum ScmProviders: String, Sendable, ParameterValue, Codable, CaseIterable {
            case repositories
            case scmProviderType
            case url

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmProviders(rawValue: string) {
                    self = value
                } else if let value = ScmProviders(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmProviders value: \(string)"
                    )
                }
            }
        }
    }
}
