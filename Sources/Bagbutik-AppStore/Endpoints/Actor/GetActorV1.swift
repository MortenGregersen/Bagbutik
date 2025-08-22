import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Actor Information
     Get information about a specific actor.

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
