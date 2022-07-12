public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionOfferCodeOneTimeUseCode(id: String,
                                                       fields: [GetSubscriptionOfferCodeOneTimeUseCode.Field]? = nil,
                                                       includes: [GetSubscriptionOfferCodeOneTimeUseCode.Include]? = nil) -> Request<SubscriptionOfferCodeOneTimeUseCodeResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionOfferCodeOneTimeUseCodes/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                             includes: includes))
    }
}

public enum GetSubscriptionOfferCodeOneTimeUseCode {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionOfferCodeOneTimeUseCodeValues
        case subscriptionOfferCodeOneTimeUseCodeValues([SubscriptionOfferCodeOneTimeUseCodeValues])
        /// The fields to include for returned resources of type subscriptionOfferCodeOneTimeUseCodes
        case subscriptionOfferCodeOneTimeUseCodes([SubscriptionOfferCodeOneTimeUseCodes])

        public enum SubscriptionOfferCodeOneTimeUseCodeValues: String, ParameterValue, CaseIterable {}
        public enum SubscriptionOfferCodeOneTimeUseCodes: String, ParameterValue, CaseIterable {
            case active
            case createdDate
            case expirationDate
            case numberOfCodes
            case offerCode
            case values
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case offerCode
    }
}
