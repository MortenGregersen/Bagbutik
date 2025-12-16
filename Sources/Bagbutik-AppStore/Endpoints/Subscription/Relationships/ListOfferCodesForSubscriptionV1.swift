import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Offer Codes for a Subscription
     Get a list of subscription offer codes for a specific auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-offerCodes>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listOfferCodesForSubscriptionV1(id: String,
                                                fields: [ListOfferCodesForSubscriptionV1.Field]? = nil,
                                                filters: [ListOfferCodesForSubscriptionV1.Filter]? = nil,
                                                includes: [ListOfferCodesForSubscriptionV1.Include]? = nil,
                                                limits: [ListOfferCodesForSubscriptionV1.Limit]? = nil) -> Request<SubscriptionOfferCodesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/offerCodes",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListOfferCodesForSubscriptionV1 {
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
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

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

        public enum Subscriptions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case familySharable
            case group
            case groupLevel
            case images
            case introductoryOffers
            case name
            case offerCodes
            case pricePoints
            case prices
            case productId
            case promotedPurchase
            case promotionalOffers
            case reviewNote
            case state
            case subscriptionAvailability
            case subscriptionLocalizations
            case subscriptionPeriod
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by territory
        case territory([String])
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related oneTimeUseCodes returned (when they are included) - maximum 50
        case oneTimeUseCodes(Int)
        /// Maximum number of related prices returned (when they are included) - maximum 50
        case prices(Int)
    }
}
