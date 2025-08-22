import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read alternative distribution domain information
     Read information for a specific alternative distribution domain.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionDomains-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionDomainV1(id: String,
                                                   fields: [GetAlternativeDistributionDomainV1.Field]? = nil) -> Request<AlternativeDistributionDomainResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionDomains/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAlternativeDistributionDomainV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionDomains
        case alternativeDistributionDomains([AlternativeDistributionDomains])

        public enum AlternativeDistributionDomains: String, Sendable, ParameterValue, Codable, CaseIterable {
            case createdDate
            case domain
            case referenceName

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionDomains(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionDomains(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionDomains value: \(string)"
                    )
                }
            }
        }
    }
}
