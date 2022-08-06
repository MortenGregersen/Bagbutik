import Bagbutik_Models

public extension Request {
    /**
     # Read the Territory Information of an App Price Point
     Get the territory in which a specific price point applies.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_territory_information_of_an_app_price_point>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getTerritoryForAppPricePointV1(id: String,
                                               fields: [GetTerritoryForAppPricePointV1.Field]? = nil) -> Request<TerritoryResponse, ErrorResponse>
    {
        .init(path: "/v1/appPricePoints/\(id)/territory", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetTerritoryForAppPricePointV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum Territories: String, ParameterValue, CaseIterable {
            case currency
        }
    }
}
