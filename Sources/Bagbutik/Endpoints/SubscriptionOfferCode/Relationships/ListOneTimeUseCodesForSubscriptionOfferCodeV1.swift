public extension Request {
    /**
      # List All One-Time Use Offer Codes for an Auto-Renewable Subscription
      Get details about a one-time use code for a specific subscription offer for an auto-renewable subscription.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_one-time_use_offer_codes_for_an_auto-renewable_subscription>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listOneTimeUseCodesForSubscriptionOfferCodeV1(id: String,
                                                              fields: [ListOneTimeUseCodesForSubscriptionOfferCodeV1.Field]? = nil,
                                                              includes: [ListOneTimeUseCodesForSubscriptionOfferCodeV1.Include]? = nil,
                                                              limit: Int? = nil) -> Request<SubscriptionOfferCodeOneTimeUseCodesResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionOfferCodes/\(id)/oneTimeUseCodes", method: .get, parameters: .init(fields: fields,
                                                                                                               includes: includes,
                                                                                                               limit: limit))
    }
}

public enum ListOneTimeUseCodesForSubscriptionOfferCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionOfferCodeOneTimeUseCodes
        case subscriptionOfferCodeOneTimeUseCodes([SubscriptionOfferCodeOneTimeUseCodes])
        /// The fields to include for returned resources of type subscriptionOfferCodes
        case subscriptionOfferCodes([SubscriptionOfferCodes])

        public enum SubscriptionOfferCodeOneTimeUseCodes: String, ParameterValue, CaseIterable {
            case active
            case createdDate
            case expirationDate
            case numberOfCodes
            case offerCode
            case values
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
        case offerCode
    }
}
