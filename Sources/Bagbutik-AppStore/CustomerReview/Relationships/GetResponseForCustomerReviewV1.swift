import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get a Customer Review Response
     Get the response to a specific customer review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_a_customer_review_response>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getResponseForCustomerReviewV1(id: String,
                                               fields: [GetResponseForCustomerReviewV1.Field]? = nil,
                                               includes: [GetResponseForCustomerReviewV1.Include]? = nil) -> Request<CustomerReviewResponseV1Response, ErrorResponse>
    {
        .init(path: "/v1/customerReviews/\(id)/response", method: .get, parameters: .init(fields: fields,
                                                                                          includes: includes))
    }
}

public enum GetResponseForCustomerReviewV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type customerReviewResponses
        case customerReviewResponses([CustomerReviewResponses])
        /// The fields to include for returned resources of type customerReviews
        case customerReviews([CustomerReviews])

        public enum CustomerReviewResponses: String, Sendable, ParameterValue, Codable, CaseIterable {
            case lastModifiedDate
            case responseBody
            case review
            case state
        }

        public enum CustomerReviews: String, Sendable, ParameterValue, Codable, CaseIterable {
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
    public enum Include: String, IncludeParameter, CaseIterable {
        case review
    }
}
