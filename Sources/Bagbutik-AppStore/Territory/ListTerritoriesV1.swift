import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Territories
     List all territories where the App Store operates.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_territories>

     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTerritoriesV1(fields: [ListTerritoriesV1.Field]? = nil,
                                  limit: Int? = nil) -> Request<TerritoriesResponse, ErrorResponse>
    {
        .init(path: "/v1/territories", method: .get, parameters: .init(fields: fields,
                                                                       limit: limit))
    }
}

public enum ListTerritoriesV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }
}
