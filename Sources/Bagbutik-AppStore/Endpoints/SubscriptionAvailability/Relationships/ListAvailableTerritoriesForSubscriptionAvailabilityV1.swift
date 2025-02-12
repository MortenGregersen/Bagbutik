import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List the territory availability of a subscription
     List the territory availability and currency of a specific subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionAvailabilities-_id_-availableTerritories>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAvailableTerritoriesForSubscriptionAvailabilityV1(id: String,
                                                                      fields: [ListAvailableTerritoriesForSubscriptionAvailabilityV1.Field]? = nil,
                                                                      limit: Int? = nil) -> Request<TerritoriesResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionAvailabilities/\(id)/availableTerritories", method: .get, parameters: .init(fields: fields,
                                                                                                                 limit: limit))
    }
}

public enum ListAvailableTerritoriesForSubscriptionAvailabilityV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }
}
