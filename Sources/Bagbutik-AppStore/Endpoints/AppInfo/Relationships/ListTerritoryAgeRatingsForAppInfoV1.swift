import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List territory age ratings for an app info
     List all territory age ratings for a specific app info.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfos-_id_-territoryAgeRatings>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTerritoryAgeRatingsForAppInfoV1(id: String,
                                                    fields: [ListTerritoryAgeRatingsForAppInfoV1.Field]? = nil,
                                                    includes: [ListTerritoryAgeRatingsForAppInfoV1.Include]? = nil,
                                                    limit: Int? = nil) -> Request<TerritoryAgeRatingsResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfos/\(id)/territoryAgeRatings",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListTerritoryAgeRatingsForAppInfoV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type territories
        case territories([Territories])
        /// The fields to include for returned resources of type territoryAgeRatings
        case territoryAgeRatings([TerritoryAgeRatings])

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

        public enum TerritoryAgeRatings: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreAgeRating
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = TerritoryAgeRatings(rawValue: string) {
                    self = value
                } else if let value = TerritoryAgeRatings(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid TerritoryAgeRatings value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case territory
    }
}
