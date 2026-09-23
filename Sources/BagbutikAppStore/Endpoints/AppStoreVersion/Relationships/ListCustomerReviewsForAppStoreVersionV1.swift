import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List all customer reviews for an app store version

     Get a list of customer reviews for a specific version of your app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/appStoreVersions/d716c220-3de9-4cf2-a885-8cfb43a11087/customerReviews?limit=1&filter%5Bterritory%5D=USA
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "customerReviews",
           "id": "00000028-b08c-0014-9674-c54800000000",
           "attributes": {
             "rating": 5,
             "title": "Pretty Stellar",
             "body": "I love how creative I can be when I use this app. I can really explore the depths of my imagination!",
             "reviewerNickname": "Juan Chavez",
             "createdDate": "2024-01-02T11:19:36-07:00",
             "territory": "USA"
           },
           "relationships": {
             "response": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/customerReviews/00000028-b08c-0014-9674-c54800000000/relationships/response",
                 "related": "https://api.appstoreconnect.apple.com/v1/customerReviews/00000028-b08c-0014-9674-c54800000000/response"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/customerReviews/00000028-b08c-0014-9674-c54800000000"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/d716c220-3de9-4cf2-a885-8cfb43a11087/customerReviews?filter%5Bterritory%5D=USA&limit=1",
         "next": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/d716c220-3de9-4cf2-a885-8cfb43a11087/customerReviews?cursor=AQ.AJJtGDc&filter%5Bterritory%5D=USA&limit=1"
       },
       "meta": {
         "paging": {
           "total": 10,
           "limit": 1
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
        /// The fields to include for returned resources of type territories
        case territories([Territories])

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
            case reviewTerritory
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

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Territories(rawValue: string) {
                    self = value
                } else if let value = Territories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Territories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'rating'
        case rating([String])
        /// Filter by id(s) of related 'reviewTerritory'
        case reviewTerritory([String])
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
        case reviewTerritory
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
