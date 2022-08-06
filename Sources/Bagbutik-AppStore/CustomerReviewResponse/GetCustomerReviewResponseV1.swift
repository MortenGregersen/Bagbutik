import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Customer Review Response Information
     Get information about a specific response you wrote to a customer review, including the response content and its state.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_customer_review_response_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCustomerReviewResponseV1(id: String,
                                            fields: [GetCustomerReviewResponseV1.Field]? = nil,
                                            includes: [GetCustomerReviewResponseV1.Include]? = nil) -> Request<CustomerReviewResponseV1Response, ErrorResponse>
    {
        .init(path: "/v1/customerReviewResponses/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                         includes: includes))
    }
}

public enum GetCustomerReviewResponseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type customerReviewResponses
        case customerReviewResponses([CustomerReviewResponses])

        public enum CustomerReviewResponses: String, ParameterValue, CaseIterable {
            case lastModifiedDate
            case responseBody
            case review
            case state
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case review
    }
}
