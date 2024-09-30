import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List marketplace domains
     List all the alternative marketplace domains for your account.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_marketplace_domains>

     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listMarketplaceDomainsV1(fields: [ListMarketplaceDomainsV1.Field]? = nil,
                                         limit: Int? = nil) -> Request<MarketplaceDomainsResponse, ErrorResponse>
    {
        .init(path: "/v1/marketplaceDomains", method: .get, parameters: .init(fields: fields,
                                                                              limit: limit))
    }
}

public enum ListMarketplaceDomainsV1 {
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
