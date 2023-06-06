import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Actor Information
     Get information about a specific actor.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_actor_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getActorV1(id: String,
                           fields: [GetActorV1.Field]? = nil) -> Request<ActorResponse, ErrorResponse>
    {
        .init(path: "/v1/actors/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetActorV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type actors
        case actors([Actors])

        public enum Actors: String, ParameterValue, Codable, CaseIterable {
            case actorType
            case apiKeyId
            case userEmail
            case userFirstName
            case userLastName
        }
    }
}
