public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listCustomCodesForSubscriptionOfferCodeV1(id: String,
                                                          fields: [ListCustomCodesForSubscriptionOfferCodeV1.Field]? = nil,
                                                          includes: [ListCustomCodesForSubscriptionOfferCodeV1.Include]? = nil,
                                                          limit: Int? = nil) -> Request<SubscriptionOfferCodeCustomCodesResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionOfferCodes/\(id)/customCodes", method: .get, parameters: .init(fields: fields,
                                                                                                           includes: includes,
                                                                                                           limit: limit))
    }
}

public enum ListCustomCodesForSubscriptionOfferCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionOfferCodeCustomCodes
        case subscriptionOfferCodeCustomCodes([SubscriptionOfferCodeCustomCodes])
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
