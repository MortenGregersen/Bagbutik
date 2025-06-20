import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Billing Grace Period Value
     Get the Boolean value that represents the billing grace period opt-in state and the duration of the billing grace period.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionGracePeriods-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionGracePeriodV1(id: String,
                                             fields: [GetSubscriptionGracePeriodV1.Field]? = nil) -> Request<SubscriptionGracePeriodResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGracePeriods/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetSubscriptionGracePeriodV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionGracePeriods
        case subscriptionGracePeriods([SubscriptionGracePeriods])

        public enum SubscriptionGracePeriods: String, Sendable, ParameterValue, Codable, CaseIterable {
            case duration
            case optIn
            case renewalType
            case sandboxOptIn
        }
    }
}
