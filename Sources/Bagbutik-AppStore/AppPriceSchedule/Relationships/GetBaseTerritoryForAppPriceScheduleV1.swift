import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the base territory for an app's price schedule
     Read the base territory and currency for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_base_territory_for_an_app_s_price_schedule>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBaseTerritoryForAppPriceScheduleV1(id: String,
                                                      fields: [GetBaseTerritoryForAppPriceScheduleV1.Field]? = nil) -> Request<TerritoryResponse, ErrorResponse>
    {
        .init(path: "/v1/appPriceSchedules/\(id)/baseTerritory", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetBaseTerritoryForAppPriceScheduleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }
}
