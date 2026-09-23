import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List the Territory Availablity of an In-App Purchase

     List all the territories where an In-App Purchase is available.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/availableTerritories
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "territories",
         "id" : "ISL",
         "attributes" : {
           "currency" : "USD"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/territories/ISL"
         }
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/availableTerritories"
       },
       "meta" : {
         "paging" : {
           "total" : 1,
           "limit" : 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseAvailabilities-_id_-availableTerritories>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAvailableTerritoriesForInAppPurchaseAvailabilityV1(id: String,
                                                                       fields: [ListAvailableTerritoriesForInAppPurchaseAvailabilityV1.Field]? = nil,
                                                                       limit: Int? = nil) -> Request<TerritoriesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseAvailabilities/\(id)/availableTerritories",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListAvailableTerritoriesForInAppPurchaseAvailabilityV1 {
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
