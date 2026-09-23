import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the Base Territory for an App's Price Schedule

     Read the base territory and currency for a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/baseTerritory
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "territories",
         "id" : "CAN",
         "attributes" : {
           "currency" : "CAD"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/territories/CAN"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/baseTerritory"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appPriceSchedules-_id_-baseTerritory>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBaseTerritoryForAppPriceScheduleV1(id: String,
                                                      fields: [GetBaseTerritoryForAppPriceScheduleV1.Field]? = nil) -> Request<TerritoryResponse, ErrorResponse> {
        .init(
            path: "/v1/appPriceSchedules/\(id)/baseTerritory",
            method: .get,
            parameters: .init(fields: fields))
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
