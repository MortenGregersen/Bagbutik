import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Routing App Coverage Information
     Get information about the routing app coverage file and its upload and processing status.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-routingAppCoverages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRoutingAppCoverageV1(id: String,
                                        fields: [GetRoutingAppCoverageV1.Field]? = nil,
                                        includes: [GetRoutingAppCoverageV1.Include]? = nil) -> Request<RoutingAppCoverageResponse, ErrorResponse> {
        .init(
            path: "/v1/routingAppCoverages/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetRoutingAppCoverageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type routingAppCoverages
        case routingAppCoverages([RoutingAppCoverages])

        public enum RoutingAppCoverages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreVersion
            case assetDeliveryState
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = RoutingAppCoverages(rawValue: string) {
                    self = value
                } else if let value = RoutingAppCoverages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid RoutingAppCoverages value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreVersion
    }
}
