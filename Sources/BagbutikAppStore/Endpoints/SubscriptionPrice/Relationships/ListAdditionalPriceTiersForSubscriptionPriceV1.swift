import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List additional price tiers for a subscription price

     List the additional volume pricing tiers for a subscription price.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPrices-_id_-additionalPriceTiers>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAdditionalPriceTiersForSubscriptionPriceV1(id: String,
                                                               fields: [ListAdditionalPriceTiersForSubscriptionPriceV1.Field]? = nil,
                                                               filters: [ListAdditionalPriceTiersForSubscriptionPriceV1.Filter]? = nil,
                                                               includes: [ListAdditionalPriceTiersForSubscriptionPriceV1.Include]? = nil,
                                                               limit: Int? = nil) -> Request<SubscriptionPriceTiersResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPrices/\(id)/additionalPriceTiers",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListAdditionalPriceTiersForSubscriptionPriceV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])
        /// The fields to include for returned resources of type subscriptionPriceTiers
        case subscriptionPriceTiers([SubscriptionPriceTiers])

        public enum SubscriptionPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case adjustedEqualizations
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

        public enum SubscriptionPriceTiers: String, Sendable, ParameterValue, Codable, CaseIterable {
            case minQuantity
            case subscriptionPricePoint

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionPriceTiers(rawValue: string) {
                    self = value
                } else if let value = SubscriptionPriceTiers(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionPriceTiers value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by subscription
        case subscription([String])
        /// Filter by territory
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscriptionPricePoint
    }
}
