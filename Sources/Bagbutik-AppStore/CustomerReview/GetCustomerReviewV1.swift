import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Customer Review Information
     Get information about a specific customer review, including the review content.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_customer_review_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCustomerReviewV1(id: String,
                                    fields: [GetCustomerReviewV1.Field]? = nil,
                                    includes: [GetCustomerReviewV1.Include]? = nil) -> Request<CustomerReviewResponse, ErrorResponse>
    {
        .init(path: "/v1/customerReviews/\(id)", method: .get, parameters: .init(fields: fields,
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

        public enum CustomerReviewResponses: String, ParameterValue, Codable, CaseIterable {
            case lastModifiedDate
            case responseBody
            case review
            case state
        }

        public enum CustomerReviews: String, ParameterValue, Codable, CaseIterable {
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
        case response
    }
}
