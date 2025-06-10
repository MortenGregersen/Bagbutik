import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the deliveries for a webhook
     Get a list of deliveries for a specific webhook configuration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-webhooks-_id_-deliveries>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDeliveriesForWebhookV1(id: String,
                                           fields: [ListDeliveriesForWebhookV1.Field]? = nil,
                                           filters: [ListDeliveriesForWebhookV1.Filter]? = nil,
                                           includes: [ListDeliveriesForWebhookV1.Include]? = nil,
                                           limit: Int? = nil) -> Request<WebhookDeliveriesResponse, ErrorResponse> {
        .init(
            path: "/v1/webhooks/\(id)/deliveries",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListDeliveriesForWebhookV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type webhookDeliveries
        case webhookDeliveries([WebhookDeliveries])
        /// The fields to include for returned resources of type webhookEvents
        case webhookEvents([WebhookEvents])

        public enum WebhookDeliveries: String, Sendable, ParameterValue, Codable, CaseIterable {
            case createdDate
            case deliveryState
            case errorMessage
            case event
            case redelivery
            case request
            case response
            case sentDate
        }

        public enum WebhookEvents: String, Sendable, ParameterValue, Codable, CaseIterable {
            case createdDate
            case eventType
            case payload
            case ping
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by createdDateGreaterThanOrEqualTo
        case createdDateGreaterThanOrEqualTo([String])
        /// Filter by createdDateLessThan
        case createdDateLessThan([String])
        /// Filter by attribute 'deliveryState'
        case deliveryState([DeliveryState])

        public enum DeliveryState: String, Sendable, ParameterValue, Codable, CaseIterable {
            case failed = "FAILED"
            case pending = "PENDING"
            case succeeded = "SUCCEEDED"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case event
    }
}
