import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get a Source Code Management Provider
     Get information about a specific source code management provider you connected to Xcode Cloud.

     The example request below retrieves information about a specific source code management provider you connected to Xcode Cloud. Use the data provided in the response to read additional information; for example, repository information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-scmProviders-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getScmProviderV1(id: String,
                                 fields: [GetScmProviderV1.Field]? = nil) -> Request<ScmProviderResponse, ErrorResponse> {
        .init(
            path: "/v1/scmProviders/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetScmProviderV1 {
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
