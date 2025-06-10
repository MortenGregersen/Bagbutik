import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read customer review summarizations
     Get the customer review summarization for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-customerReviewSummarizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCustomerReviewSummarizationsForAppV1(id: String,
                                                         fields: [ListCustomerReviewSummarizationsForAppV1.Field]? = nil,
                                                         filters: [ListCustomerReviewSummarizationsForAppV1.Filter]? = nil,
                                                         includes: [ListCustomerReviewSummarizationsForAppV1.Include]? = nil,
                                                         limit: Int? = nil) -> Request<CustomerReviewSummarizationsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/customerReviewSummarizations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListCustomerReviewSummarizationsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type customerReviewSummarizations
        case customerReviewSummarizations([CustomerReviewSummarizations])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum CustomerReviewSummarizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case createdDate
            case locale
            case platform
            case territory
            case text
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.

     Required: `platform`
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'platform'
        case platform([Platform])
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case territory
    }
}
