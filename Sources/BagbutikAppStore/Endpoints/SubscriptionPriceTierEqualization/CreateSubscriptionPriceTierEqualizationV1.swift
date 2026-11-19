import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription price tier equalization

     Calculate equalized volume pricing tiers for every territory from a base territory’s tiers.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionPriceTierEqualizations>

     - Parameter requestBody: SubscriptionPriceTierEqualization representation
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related priceTierPricePoints returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionPriceTierEqualizationV1(requestBody: SubscriptionPriceTierEqualizationCreateRequest,
                                                          fields: [CreateSubscriptionPriceTierEqualizationV1.Field]? = nil,
                                                          includes: [CreateSubscriptionPriceTierEqualizationV1.Include]? = nil,
                                                          limit: CreateSubscriptionPriceTierEqualizationV1.Limit? = nil) -> Request<SubscriptionPriceTierEqualizationResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPriceTierEqualizations",
            method: .post,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }),
            requestBody: requestBody)
    }
}

public enum CreateSubscriptionPriceTierEqualizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])
        /// The fields to include for returned resources of type subscriptionPriceTierEqualizations
        case subscriptionPriceTierEqualizations([SubscriptionPriceTierEqualizations])

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

        public enum SubscriptionPriceTierEqualizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case equalizedPrices
            case priceTierPricePoints

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionPriceTierEqualizations(rawValue: string) {
                    self = value
                } else if let value = SubscriptionPriceTierEqualizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionPriceTierEqualizations value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case priceTierPricePoints
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related priceTierPricePoints returned (when they are included) - maximum 50
        case priceTierPricePoints(Int)
    }
}
