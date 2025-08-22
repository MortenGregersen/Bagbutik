import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the selected base territory for an in-app purchase price schedule
     Get information about the selected base territory for an in-app purchase price schedule.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchasePriceSchedules-_id_-baseTerritory>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBaseTerritoryForInAppPurchasePriceScheduleV1(id: String,
                                                                fields: [GetBaseTerritoryForInAppPurchasePriceScheduleV1.Field]? = nil) -> Request<TerritoryResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePriceSchedules/\(id)/baseTerritory",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBaseTerritoryForInAppPurchasePriceScheduleV1 {
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
