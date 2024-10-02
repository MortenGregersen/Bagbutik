import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the availability of a subscription
     Get information about the territory availability for a subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionAvailabilities-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related availableTerritories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionAvailabilityV1(id: String,
                                              fields: [GetSubscriptionAvailabilityV1.Field]? = nil,
                                              includes: [GetSubscriptionAvailabilityV1.Include]? = nil,
                                              limit: GetSubscriptionAvailabilityV1.Limit? = nil) -> Request<SubscriptionAvailabilityResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionAvailabilities/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                            includes: includes,
                                                                                            limits: limit.map { [$0] }))
    }
}

public enum GetSubscriptionAvailabilityV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionAvailabilities
        case subscriptionAvailabilities([SubscriptionAvailabilities])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum SubscriptionAvailabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case availableTerritories
            case subscription
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case availableTerritories
        case subscription
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related availableTerritories returned (when they are included) - maximum 50
        case availableTerritories(Int)
    }
}
