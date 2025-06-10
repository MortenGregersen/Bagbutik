import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Subscription Price Point Equalizations
     Get a list of subscription price points and their equivalent in a specified currency.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPricePoints-_id_-equalizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 8000
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listEqualizationsForSubscriptionPricePointV1(id: String,
                                                             fields: [ListEqualizationsForSubscriptionPricePointV1.Field]? = nil,
                                                             filters: [ListEqualizationsForSubscriptionPricePointV1.Filter]? = nil,
                                                             includes: [ListEqualizationsForSubscriptionPricePointV1.Include]? = nil,
                                                             limit: Int? = nil) -> Request<SubscriptionPricePointsResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPricePoints/\(id)/equalizations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListEqualizationsForSubscriptionPricePointV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum SubscriptionPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case proceedsYear2
            case territory
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'subscription'
        case subscription([String])
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case equalizations
        case territory
    }
}
