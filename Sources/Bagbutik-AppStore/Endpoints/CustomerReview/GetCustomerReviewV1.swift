import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Customer Review Information
     Get information about a specific customer review, including the review content.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-customerReviews-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCustomerReviewV1(id: String,
                                    fields: [GetCustomerReviewV1.Field]? = nil,
                                    includes: [GetCustomerReviewV1.Include]? = nil) -> Request<CustomerReviewResponse, ErrorResponse> {
        .init(
            path: "/v1/customerReviews/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
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

        public enum CustomerReviews: String, Sendable, ParameterValue, Codable, CaseIterable {
            case body
            case createdDate
            case rating
            case response
            case reviewerNickname
            case territory
            case title

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CustomerReviews(rawValue: string) {
                    self = value
                } else if let value = CustomerReviews(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CustomerReviews value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case response
    }
}
