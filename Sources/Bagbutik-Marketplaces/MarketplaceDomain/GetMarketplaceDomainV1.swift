import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read marketplace domain information
     Read information for a specific alternative marketplace domain.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_marketplace_domain_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getMarketplaceDomainV1(id: String,
                                       fields: [GetMarketplaceDomainV1.Field]? = nil) -> Request<MarketplaceDomainResponse, ErrorResponse>
    {
        .init(path: "/v1/marketplaceDomains/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetMarketplaceDomainV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type marketplaceDomains
        case marketplaceDomains([MarketplaceDomains])

        public enum MarketplaceDomains: String, Sendable, ParameterValue, Codable, CaseIterable {
            case createdDate
            case domain
            case referenceName
        }
    }
}
