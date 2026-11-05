import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the retention message for a subscription

     Get the retention message for a specific auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-retentionMessage>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRetentionMessageForSubscriptionV1(id: String,
                                                     fields: [GetRetentionMessageForSubscriptionV1.Field]? = nil,
                                                     includes: [GetRetentionMessageForSubscriptionV1.Include]? = nil,
                                                     limits: [GetRetentionMessageForSubscriptionV1.Limit]? = nil) -> Request<RetentionMessageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/retentionMessage",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetRetentionMessageForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type retentionMessageVersions
        case retentionMessageVersions([RetentionMessageVersions])
        /// The fields to include for returned resources of type retentionMessages
        case retentionMessages([RetentionMessages])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

        public enum RetentionMessageVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case localizations
            case placement
            case retentionMessage
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = RetentionMessageVersions(rawValue: string) {
                    self = value
                } else if let value = RetentionMessageVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid RetentionMessageVersions value: \(string)"
                    )
                }
            }
        }

        public enum RetentionMessages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case referenceName
            case subscriptions
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = RetentionMessages(rawValue: string) {
                    self = value
                } else if let value = RetentionMessages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid RetentionMessages value: \(string)"
                    )
                }
            }
        }

        public enum Subscriptions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case familySharable
            case group
            case groupLevel
            case images
            case introductoryOffers
            case marketSettings
            case multiSeatStatus
            case name
            case offerCodes
            case planAvailabilities
            case pricePoints
            case prices
            case productId
            case promotedPurchase
            case promotionalOffers
            case retentionMessage
            case retentionMessageOffers
            case retentionOffers
            case reviewNote
            case state
            case subscriptionAvailability
            case subscriptionLocalizations
            case subscriptionPeriod
            case versions
            case winBackOffers

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Subscriptions(rawValue: string) {
                    self = value
                } else if let value = Subscriptions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Subscriptions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscriptions
        case versions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related subscriptions returned (when they are included) - maximum 50
        case subscriptions(Int)
        /// Maximum number of related versions returned (when they are included) - maximum 50
        case versions(Int)
    }
}
