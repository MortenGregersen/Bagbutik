import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read information about the availablity of an In-App Purchase

     Get information about the territory availablity for an In-App Purchase.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593
     ```

     **Response:**

     ```json
       "data" : {
         "type" : "inAppPurchaseAvailabilities",
         "id" : "6447501593",
         "attributes" : {
           "availableInNewTerritories" : false
         },
         "relationships" : {
           "availableTerritories" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/relationships/availableTerritories",
               "related" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/availableTerritories"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseAvailabilities-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related availableTerritories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseAvailabilityV1(id: String,
                                               fields: [GetInAppPurchaseAvailabilityV1.Field]? = nil,
                                               includes: [GetInAppPurchaseAvailabilityV1.Include]? = nil,
                                               limit: GetInAppPurchaseAvailabilityV1.Limit? = nil) -> Request<InAppPurchaseAvailabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseAvailabilities/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetInAppPurchaseAvailabilityV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseAvailabilities
        case inAppPurchaseAvailabilities([InAppPurchaseAvailabilities])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchaseAvailabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case availableTerritories

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseAvailabilities(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseAvailabilities(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseAvailabilities value: \(string)"
                    )
                }
            }
        }

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

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case availableTerritories
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related availableTerritories returned (when they are included) - maximum 50
        case availableTerritories(Int)
    }
}
