import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Actors
     Get a list of actors.

     This endpoint supports multiple id’s in the filter paramenter.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_actors>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listActorsV1(fields: [ListActorsV1.Field]? = nil,
                             filters: [ListActorsV1.Filter]? = nil,
                             limit: Int? = nil) -> Request<ActorsResponse, ErrorResponse>
    {
        .init(path: "/v1/actors", method: .get, parameters: .init(fields: fields,
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

        public enum Actors: String, ParameterValue, Codable, CaseIterable {
            case actorType
            case apiKeyId
            case userEmail
            case userFirstName
            case userLastName
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
