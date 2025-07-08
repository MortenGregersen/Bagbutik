import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read webhook information
     Read configuration details for a specific webhook.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-webhooks-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getWebhookV1(id: String,
                             fields: [GetWebhookV1.Field]? = nil,
                             includes: [GetWebhookV1.Include]? = nil) -> Request<WebhookResponse, ErrorResponse> {
        .init(
            path: "/v1/webhooks/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetWebhookV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type webhooks
        case webhooks([Webhooks])

        public enum Webhooks: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case deliveries
            case enabled
            case eventTypes
            case name
            case url
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
    }
}
