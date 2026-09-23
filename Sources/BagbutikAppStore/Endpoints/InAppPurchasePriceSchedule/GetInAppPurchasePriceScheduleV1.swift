import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read In-App Purchase Price Schedule Information

     Get information about a specific scheduled price change for an In-App Purchase.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "inAppPurchasePriceSchedules",
         "id" : "6447501593",
         "relationships" : {
           "baseTerritory" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/relationships/baseTerritory",
               "related" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/baseTerritory"
             }
           },
           "manualPrices" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/relationships/manualPrices",
               "related" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/manualPrices"
             }
           },
           "automaticPrices" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/relationships/automaticPrices",
               "related" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593/automaticPrices"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/6447501593"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchasePriceSchedules-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchasePriceScheduleV1(id: String,
                                                fields: [GetInAppPurchasePriceScheduleV1.Field]? = nil,
                                                includes: [GetInAppPurchasePriceScheduleV1.Include]? = nil,
                                                limits: [GetInAppPurchasePriceScheduleV1.Limit]? = nil) -> Request<InAppPurchasePriceScheduleResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePriceSchedules/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetInAppPurchasePriceScheduleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchasePriceSchedules
        case inAppPurchasePriceSchedules([InAppPurchasePriceSchedules])
        /// The fields to include for returned resources of type inAppPurchasePrices
        case inAppPurchasePrices([InAppPurchasePrices])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchasePriceSchedules: String, Sendable, ParameterValue, Codable, CaseIterable {
            case automaticPrices
            case baseTerritory
            case manualPrices

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchasePriceSchedules(rawValue: string) {
                    self = value
                } else if let value = InAppPurchasePriceSchedules(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchasePriceSchedules value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchasePrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case endDate
            case inAppPurchasePricePoint
            case manual
            case startDate
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchasePrices(rawValue: string) {
                    self = value
                } else if let value = InAppPurchasePrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchasePrices value: \(string)"
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
        case automaticPrices
        case baseTerritory
        case manualPrices
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related automaticPrices returned (when they are included) - maximum 50
        case automaticPrices(Int)
        /// Maximum number of related manualPrices returned (when they are included) - maximum 50
        case manualPrices(Int)
    }
}
