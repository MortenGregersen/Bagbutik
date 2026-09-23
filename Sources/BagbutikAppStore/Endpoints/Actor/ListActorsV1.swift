import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List all actors

     Get a list of actors.

     ## Discussion

     This endpoint supports multiple id’s in the filter paramenter.

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/actors?filter%5Bid%5D=USER%3A2cd2a1ef-cb74-411c-a078-0ebe119ade73,USER%3A83f7ddc0-64d6-4e4f-a5d9-51d74a8009a3
     ```

     **Response:**

     ```json
     {  “data” : [ {
         “type” : “actors”,
         “id” : “USER:83f7ddc0-64d6-4e4f-a5d9-51d74a8009a3”,
         “attributes” : {
           “actorType” : “USER”,
           “userFirstName” : “Maria”,
           “userLastName” : “Ruiz”,
           “userEmail” : “mruiz2@icloud.com”,
           “apiKeyId” : null
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/actors/USER%3A83f7ddc0-64d6-4e4f-a5d9-51d74a8009a3”
         }
       }, {
         “type” : “actors”,
         “id” : “USER:2cd2a1ef-cb74-411c-a078-0ebe119ade73”,
         “attributes” : {
           “actorType” : “USER”,
           “userFirstName” : “Bill”,
           “userLastName” : “James”,
           “userEmail” : “billjames2@icloud.com”,
           “apiKeyId” : null
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/actors/USER%3A2cd2a1ef-cb74-411c-a078-0ebe119ade73”
         }
       } ],
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/actors?filter%5Bid%5D=USER%3A2cd2a1ef-cb74-411c-a078-0ebe119ade73%2CUSER%3A83f7ddc0-64d6-4e4f-a5d9-51d74a8009a3”
       },
       “meta” : {
         “paging” : {
           “total” : 2,
           “limit” : 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-actors>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listActorsV1(fields: [ListActorsV1.Field]? = nil,
                             filters: [ListActorsV1.Filter]? = nil,
                             limit: Int? = nil) -> Request<ActorsResponse, ErrorResponse> {
        .init(
            path: "/v1/actors",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                limit: limit))
    }
}

public enum ListActorsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type actors
        case actors([Actors])

        public enum Actors: String, Sendable, ParameterValue, Codable, CaseIterable {
            case actorType
            case apiKeyId
            case userEmail
            case userFirstName
            case userLastName

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Actors(rawValue: string) {
                    self = value
                } else if let value = Actors(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Actors value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.

     Required: `id`
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s)
        case id([String])
    }
}
