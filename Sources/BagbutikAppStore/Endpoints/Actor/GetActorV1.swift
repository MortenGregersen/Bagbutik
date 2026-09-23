import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read actor information

     Get information about a specific actor.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/actors/USER:2cd2a1ef-cb74-411c-a078-0ebe119ade73
     ```

     **Response:**

     ```json
     {
       “data” : {
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
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/actors/USER%3A2cd2a1ef-cb74-411c-a078-0ebe119ade73”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-actors-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getActorV1(id: String,
                           fields: [GetActorV1.Field]? = nil) -> Request<ActorResponse, ErrorResponse> {
        .init(
            path: "/v1/actors/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetActorV1 {
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
}
