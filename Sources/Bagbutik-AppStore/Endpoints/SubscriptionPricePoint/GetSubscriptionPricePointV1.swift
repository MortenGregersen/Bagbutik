import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Subscription Price Point Information
     Get details about a specific subscription price point.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPricePoints-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionPricePointV1(id: String,
                                            fields: [GetSubscriptionPricePointV1.Field]? = nil,
                                            includes: [GetSubscriptionPricePointV1.Include]? = nil) -> Request<SubscriptionPricePointResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPricePoints/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetSubscriptionPricePointV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])

        public enum SubscriptionPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case proceedsYear2
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionPricePoints(rawValue: string) {
                    self = value
                } else if let value = SubscriptionPricePoints(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionPricePoints value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case territory
    }
}
