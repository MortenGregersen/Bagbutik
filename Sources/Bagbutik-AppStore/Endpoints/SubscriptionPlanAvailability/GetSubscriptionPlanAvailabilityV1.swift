import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read subscription plan availability information
     Get information about a specific subscription plan availability.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPlanAvailabilities-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related availableTerritories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionPlanAvailabilityV1(id: String,
                                                  fields: [GetSubscriptionPlanAvailabilityV1.Field]? = nil,
                                                  includes: [GetSubscriptionPlanAvailabilityV1.Include]? = nil,
                                                  limit: GetSubscriptionPlanAvailabilityV1.Limit? = nil) -> Request<SubscriptionPlanAvailabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPlanAvailabilities/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetSubscriptionPlanAvailabilityV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPlanAvailabilities
        case subscriptionPlanAvailabilities([SubscriptionPlanAvailabilities])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum SubscriptionPlanAvailabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case availableTerritories
            case planType

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionPlanAvailabilities(rawValue: string) {
                    self = value
                } else if let value = SubscriptionPlanAvailabilities(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionPlanAvailabilities value: \(string)"
                    )
                }
            }
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Territories(rawValue: string) {
                    self = value
                } else if let value = Territories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Territories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case availableTerritories
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related availableTerritories returned (when they are included) - maximum 50
        case availableTerritories(Int)
    }
}
