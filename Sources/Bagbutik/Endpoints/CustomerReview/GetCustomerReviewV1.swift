public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getCustomerReviewV1(id: String,
                                    fields: [GetCustomerReviewV1.Field]? = nil,
                                    includes: [GetCustomerReviewV1.Include]? = nil) -> Request<CustomerReviewResponse, ErrorResponse>
    {
        return .init(path: "/v1/customerReviews/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes))
    }
}

public enum GetCustomerReviewV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type customerReviewResponses
        case customerReviewResponses([CustomerReviewResponses])
        /// The fields to include for returned resources of type customerReviews
        case customerReviews([CustomerReviews])

        public enum CustomerReviewResponses: String, ParameterValue, CaseIterable {
            case lastModifiedDate
            case responseBody
            case review
            case state
        }

        public enum CustomerReviews: String, ParameterValue, CaseIterable {
            case body
            case createdDate
            case rating
            case response
            case reviewerNickname
            case territory
            case title
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case response
    }
}