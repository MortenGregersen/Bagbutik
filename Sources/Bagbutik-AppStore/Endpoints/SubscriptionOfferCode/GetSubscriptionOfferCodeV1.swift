import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Subscription Offer Code Information
     Get details about a specific subscription offer that has offer codes for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionOfferCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionOfferCodeV1(id: String,
                                           fields: [GetSubscriptionOfferCodeV1.Field]? = nil,
                                           includes: [GetSubscriptionOfferCodeV1.Include]? = nil,
                                           limits: [GetSubscriptionOfferCodeV1.Limit]? = nil) -> Request<SubscriptionOfferCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodes/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetSubscriptionOfferCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionOfferCodeCustomCodes
        case subscriptionOfferCodeCustomCodes([SubscriptionOfferCodeCustomCodes])
        /// The fields to include for returned resources of type subscriptionOfferCodeOneTimeUseCodes
        case subscriptionOfferCodeOneTimeUseCodes([SubscriptionOfferCodeOneTimeUseCodes])
        /// The fields to include for returned resources of type subscriptionOfferCodePrices
        case subscriptionOfferCodePrices([SubscriptionOfferCodePrices])
        /// The fields to include for returned resources of type subscriptionOfferCodes
        case subscriptionOfferCodes([SubscriptionOfferCodes])

        public enum SubscriptionOfferCodeCustomCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case createdDate
            case customCode
            case expirationDate
            case numberOfCodes
            case offerCode

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionOfferCodeCustomCodes(rawValue: string) {
                    self = value
                } else if let value = SubscriptionOfferCodeCustomCodes(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionOfferCodeCustomCodes value: \(string)"
                    )
                }
            }
        }

        public enum SubscriptionOfferCodeOneTimeUseCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case createdDate
            case environment
            case expirationDate
            case numberOfCodes
            case offerCode
            case values

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionOfferCodeOneTimeUseCodes(rawValue: string) {
                    self = value
                } else if let value = SubscriptionOfferCodeOneTimeUseCodes(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionOfferCodeOneTimeUseCodes value: \(string)"
                    )
                }
            }
        }

        public enum SubscriptionOfferCodePrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case subscriptionPricePoint
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionOfferCodePrices(rawValue: string) {
                    self = value
                } else if let value = SubscriptionOfferCodePrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionOfferCodePrices value: \(string)"
                    )
                }
            }
        }

        public enum SubscriptionOfferCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case autoRenewEnabled
            case customCodes
            case customerEligibilities
            case duration
            case name
            case numberOfPeriods
            case offerEligibility
            case offerMode
            case oneTimeUseCodes
            case prices
            case productionCodeCount
            case sandboxCodeCount
            case subscription
            case totalNumberOfCodes

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionOfferCodes(rawValue: string) {
                    self = value
                } else if let value = SubscriptionOfferCodes(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionOfferCodes value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case customCodes
        case oneTimeUseCodes
        case prices
        case subscription
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related customCodes returned (when they are included) - maximum 50
        case customCodes(Int)
        /// Maximum number of related oneTimeUseCodes returned (when they are included) - maximum 50
        case oneTimeUseCodes(Int)
        /// Maximum number of related prices returned (when they are included) - maximum 50
        case prices(Int)
    }
}
