public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionOfferCodeCustomCode(id: String,
                                                   fields: [GetSubscriptionOfferCodeCustomCode.Field]? = nil,
                                                   includes: [GetSubscriptionOfferCodeCustomCode.Include]? = nil) -> Request<SubscriptionOfferCodeCustomCodeResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionOfferCodeCustomCodes/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                         includes: includes))
    }
}

public enum GetSubscriptionOfferCodeCustomCode {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionOfferCodeCustomCodes
        case subscriptionOfferCodeCustomCodes([SubscriptionOfferCodeCustomCodes])

        public enum SubscriptionOfferCodeCustomCodes: String, ParameterValue, CaseIterable {
            case active
            case createdDate
            case customCode
            case expirationDate
            case numberOfCodes
            case offerCode
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case offerCode
    }
}
