import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read marketplace webhook information
     Get the endpoint URL for alternative distribution package notifications.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_marketplace_webhook_information>

     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listMarketplaceWebhooksV1(fields: [ListMarketplaceWebhooksV1.Field]? = nil,
                                          limit: Int? = nil) -> Request<MarketplaceWebhooksResponse, ErrorResponse>
    {
        .init(path: "/v1/marketplaceWebhooks", method: .get, parameters: .init(fields: fields,
                                                                               limit: limit))
    }
}

public enum ListMarketplaceWebhooksV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type marketplaceWebhooks
        case marketplaceWebhooks([MarketplaceWebhooks])

        public enum MarketplaceWebhooks: String, ParameterValue, Codable, CaseIterable {
            case endpointUrl
            case secret
        }
    }
}
