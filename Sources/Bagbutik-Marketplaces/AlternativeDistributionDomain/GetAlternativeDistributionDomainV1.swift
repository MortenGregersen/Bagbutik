import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read alternative distribution domain information
     Read information for a specific alternative distribution domain.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_alternative_distribution_domain_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionDomainV1(id: String,
                                                   fields: [GetAlternativeDistributionDomainV1.Field]? = nil) -> Request<AlternativeDistributionDomainResponse, ErrorResponse>
    {
        .init(path: "/v1/alternativeDistributionDomains/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAlternativeDistributionDomainV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionDomains
        case alternativeDistributionDomains([AlternativeDistributionDomains])

        public enum AlternativeDistributionDomains: String, ParameterValue, Codable, CaseIterable {
            case createdDate
            case domain
            case referenceName
        }
    }
}
