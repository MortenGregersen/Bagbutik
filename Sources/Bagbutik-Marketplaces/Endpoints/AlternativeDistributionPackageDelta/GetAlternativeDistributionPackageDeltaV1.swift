import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read information for alternative distribution package deltas
     Get detail information about specific alternative distribution package deltas.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionPackageDeltas-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageDeltaV1(id: String,
                                                         fields: [GetAlternativeDistributionPackageDeltaV1.Field]? = nil) -> Request<AlternativeDistributionPackageDeltaResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackageDeltas/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAlternativeDistributionPackageDeltaV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionPackageDeltas
        case alternativeDistributionPackageDeltas([AlternativeDistributionPackageDeltas])

        public enum AlternativeDistributionPackageDeltas: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackageDeltas(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackageDeltas(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackageDeltas value: \(string)"
                    )
                }
            }
        }
    }
}
