import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Customer Reviews for an App Store Version
     Get a list of customer reviews for a specific version of your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-customerReviews>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter exists: Attributes, relationships, and IDs to check for existence
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCustomerReviewsForAppStoreVersionV1(id: String,
                                                        fields: [ListCustomerReviewsForAppStoreVersionV1.Field]? = nil,
                                                        filters: [ListCustomerReviewsForAppStoreVersionV1.Filter]? = nil,
                                                        exists: [ListCustomerReviewsForAppStoreVersionV1.Exist]? = nil,
                                                        includes: [ListCustomerReviewsForAppStoreVersionV1.Include]? = nil,
                                                        sorts: [ListCustomerReviewsForAppStoreVersionV1.Sort]? = nil,
                                                        limit: Int? = nil) -> Request<CustomerReviewsResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/customerReviews",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                exists: exists,
                includes: includes,
                sorts: sorts,
                limit: limit))
    }
}

public enum ListCustomerReviewsForAppStoreVersionV1 {
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'rating'
        case rating([String])
        /// Filter by attribute 'territory'
        case territory([TerritoryCode])
    }

    /**
     Attributes, relationships, and IDs to check for existence.
     */
    public enum Exist: ExistParameter {
        /// Filter by publishedResponse
        case publishedResponse(Bool)
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case response
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case createdDateAscending = "createdDate"
        case createdDateDescending = "-createdDate"
        case ratingAscending = "rating"
        case ratingDescending = "-rating"
    }
}
