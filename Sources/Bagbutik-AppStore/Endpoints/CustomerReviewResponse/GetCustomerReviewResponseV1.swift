import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Customer Review Response Information
     Get information about a specific response you wrote to a customer review, including the response content and its state.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-customerReviewResponses-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCustomerReviewResponseV1(id: String,
                                            fields: [GetCustomerReviewResponseV1.Field]? = nil,
                                            includes: [GetCustomerReviewResponseV1.Include]? = nil) -> Request<CustomerReviewResponseV1Response, ErrorResponse> {
        .init(
            path: "/v1/customerReviewResponses/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
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

        public enum CustomerReviewResponses: String, Sendable, ParameterValue, Codable, CaseIterable {
            case lastModifiedDate
            case responseBody
            case review
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CustomerReviewResponses(rawValue: string) {
                    self = value
                } else if let value = CustomerReviewResponses(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CustomerReviewResponses value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case review
    }
}
