public extension Request {
    /**
      # Read Subscription Offer Code Information
      Get details about a specific subscription offer that has offer codes for an auto-renewable subscription.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_subscription_offer_code_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionOfferCodeV1(id: String,
                                           fields: [GetSubscriptionOfferCodeV1.Field]? = nil,
                                           includes: [GetSubscriptionOfferCodeV1.Include]? = nil,
                                           limits: [GetSubscriptionOfferCodeV1.Limit]? = nil) -> Request<SubscriptionOfferCodeResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionOfferCodes/\(id)", method: .get, parameters: .init(fields: fields,
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

        public enum SubscriptionOfferCodeCustomCodes: String, ParameterValue, CaseIterable {
            case active
            case createdDate
            case customCode
            case expirationDate
            case numberOfCodes
            case offerCode
        }

        public enum SubscriptionOfferCodeOneTimeUseCodes: String, ParameterValue, CaseIterable {
            case active
            case createdDate
            case expirationDate
            case numberOfCodes
            case offerCode
            case values
        }

        public enum SubscriptionOfferCodePrices: String, ParameterValue, CaseIterable {
            case subscriptionPricePoint
            case territory
        }

        public enum SubscriptionOfferCodes: String, ParameterValue, CaseIterable {
            case active
            case customCodes
            case customerEligibilities
            case duration
            case name
            case numberOfPeriods
            case offerEligibility
            case offerMode
            case oneTimeUseCodes
            case prices
            case subscription
            case totalNumberOfCodes
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case customCodes, oneTimeUseCodes, prices, subscription
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
