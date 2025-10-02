import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read marketplace webhook information
     Get the endpoint URL for alternative distribution package notifications.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-marketplaceWebhooks>

     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listMarketplaceWebhooksV1(fields: [ListMarketplaceWebhooksV1.Field]? = nil,
                                          limit: Int? = nil) -> Request<MarketplaceWebhooksResponse, ErrorResponse> {
        .init(
            path: "/v1/marketplaceWebhooks",
            method: .get,
            parameters: .init(
                fields: fields,
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

        public enum MarketplaceWebhooks: String, Sendable, ParameterValue, Codable, CaseIterable {
            case endpointUrl

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = MarketplaceWebhooks(rawValue: string) {
                    self = value
                } else if let value = MarketplaceWebhooks(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid MarketplaceWebhooks value: \(string)"
                    )
                }
            }
        }
    }
}
