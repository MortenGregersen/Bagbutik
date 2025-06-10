import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List alternative distribution domains
     List all the alternative distribution domains for your account.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionDomains>

     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAlternativeDistributionDomainsV1(fields: [ListAlternativeDistributionDomainsV1.Field]? = nil,
                                                     limit: Int? = nil) -> Request<AlternativeDistributionDomainsResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionDomains",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListAlternativeDistributionDomainsV1 {
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
        }
    }
}
