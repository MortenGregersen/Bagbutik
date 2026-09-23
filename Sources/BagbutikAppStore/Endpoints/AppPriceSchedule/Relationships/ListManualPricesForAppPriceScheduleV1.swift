import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List Manually Chosen Prices for an App

     List the prices you chose for a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/manualPrices?limit=200&include=appPricePoint,territory&fields%5BappPricePoints%5D=customerPrice&filter%5Bterritory%5D=USA,CAN&fields%5Bterritories%5D=currency
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDciLCJzZCI6MC4wLCJlZCI6MC4wfQ",
         "attributes" : {
           "manual" : true,
           "startDate" : null,
           "endDate" : null
         },
         "relationships" : {
           "appPricePoint" : {
             "data" : {
               "type" : "appPricePoints",
               "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDcifQ"
             }
           },
           "territory" : {
             "data" : {
               "type" : "territories",
               "id" : "CAN"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDciLCJzZCI6MC4wLCJlZCI6MC4wfQ"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDciLCJzZCI6MC4wLCJlZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDB9",
         "attributes" : {
           "manual" : true,
           "startDate" : null,
           "endDate" : "2023-02-28"
         },
         "relationships" : {
           "appPricePoint" : {
             "data" : {
               "type" : "appPricePoints",
               "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDcifQ"
             }
           },
           "territory" : {
             "data" : {
               "type" : "territories",
               "id" : "USA"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDciLCJzZCI6MC4wLCJlZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDB9"
         }
       } ],
       "included" : [ {
         "type" : "appPricePoints",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDcifQ",
         "attributes" : {
           "customerPrice" : "9.99"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDcifQ"
         }
       }, {
         "type" : "territories",
         "id" : "CAN",
         "attributes" : {
           "currency" : "CAD"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/territories/CAN"
         }
       }, {
         "type" : "appPricePoints",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDcifQ",
         "attributes" : {
           "customerPrice" : "0.89"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDcifQ"
         }
       }, {
         "type" : "territories",
         "id" : "USA",
         "attributes" : {
           "currency" : "USD"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/territories/USA"
         }
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/manualPrices?include=appPricePoint%2Cterritory&fields%5BappPricePoints%5D=customerPrice&filter%5Bterritory%5D=CAN%2CUSA&limit=200&fields%5Bterritories%5D=currency"
       },
       "meta" : {
         "paging" : {
           "total" : 2,
           "limit" : 200
         }
       }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appPriceSchedules-_id_-manualPrices>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listManualPricesForAppPriceScheduleV1(id: String,
                                                      fields: [ListManualPricesForAppPriceScheduleV1.Field]? = nil,
                                                      filters: [ListManualPricesForAppPriceScheduleV1.Filter]? = nil,
                                                      includes: [ListManualPricesForAppPriceScheduleV1.Include]? = nil,
                                                      limit: Int? = nil) -> Request<AppPricesV2Response, ErrorResponse> {
        .init(
            path: "/v1/appPriceSchedules/\(id)/manualPrices",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListManualPricesForAppPriceScheduleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type appPrices
        case appPrices([AppPrices])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case customerPrice
            case equalizations
            case proceeds
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppPricePoints(rawValue: string) {
                    self = value
                } else if let value = AppPricePoints(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppPricePoints value: \(string)"
                    )
                }
            }
        }

        public enum AppPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPricePoint
            case endDate
            case manual
            case startDate
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppPrices(rawValue: string) {
                    self = value
                } else if let value = AppPrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppPrices value: \(string)"
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'endDate'
        case endDate([String])
        /// Filter by attribute 'startDate'
        case startDate([String])
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appPricePoint
        case territory
    }
}
