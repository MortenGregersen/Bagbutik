import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List territories for an app tag
     List territory availability for a specific app tag.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appTags-_id_-territories>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTerritoriesForAppTagV1(id: String,
                                           fields: [ListTerritoriesForAppTagV1.Field]? = nil,
                                           limit: Int? = nil) -> Request<TerritoriesResponse, ErrorResponse> {
        .init(
            path: "/v1/appTags/\(id)/territories",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListTerritoriesForAppTagV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type territories
        case territories([Territories])

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
}
