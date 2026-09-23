import BagbutikCore
import BagbutikReportingModels

public extension Request {
    /**
     # List all diagnostic signatures for a build

     List the aggregate backtrace signatures captured for a specific build.

     ## Discussion

     The example below requests the top two weighted disk write diagnostic signatures. The example response returns two signatures that are responsible for 85% and 7% of disk writes.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/builds/1a254ec1-8e3d-48e7-bbd6-6b9a30072b29/diagnosticSignatures?filter[diagnosticType]=DISK_WRITES&limit=2
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "diagnosticSignatures",
           "id": "35fd8da9ea3dd8d2a64cb3d458fa59b2b41e66115f7ca5fa34df25a9419c5216dd",
           "attributes": {
             "diagnosticType": "DISK_WRITES",
             "signature": "ExampleApp: -[DatabaseConnection executeSQL:enumerateRowsWithBlock:] + 23",
             "weight": 0.85
           },
           "relationships": {
             "logs": {
               "links": {
                 "related": "https://api.appstoreconnect.apple.com/v1/diagnosticSignatures/35fd8da9ea3dd8d2a64cb3d458fa59b2b41e66115f7ca5fa34df25a9419c5216dd/logs"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/diagnosticSignatures/35fd8da9ea3dd8d2a64cb3d458fa59b2b41e66115f7ca5fa34df25a9419c5216dd"
           }
         },
         {
           "type": "diagnosticSignatures",
           "id": "351c486f96912d7520ef0ceea8efe19aca98f41e3b111a77e64f6923d6eba0e2c7",
           "attributes": {
             "diagnosticType": "DISK_WRITES",
             "signature": "ExampleApp: -[TemporaryFile appendData:] + 100",
             "weight": 0.07
           },
           "relationships": {
             "logs": {
               "links": {
                 "related": "https://api.appstoreconnect.apple.com/v1/diagnosticSignatures/351c486f96912d7520ef0ceea8efe19aca98f41e3b111a77e64f6923d6eba0e2c7/logs"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/diagnosticSignatures/351c486f96912d7520ef0ceea8efe19aca98f41e3b111a77e64f6923d6eba0e2c7"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/builds/1a254ec1-8e3d-48e7-bbd6-6b9a30072b29/diagnosticSignatures?limit=3&filter%5BdiagnosticType%5D=DISK_WRITES",
         "next": "https://api.appstoreconnect.apple.com/v1/builds/1a254ec1-8e3d-48e7-bbd6-6b9a30072b29/diagnosticSignatures?cursor=Aw.AOYOFlQ&limit=3&filter%5BdiagnosticType%5D=DISK_WRITES"
       },
       "meta": {
         "paging": {
           "total": 4,
           "limit": 2
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-diagnosticSignatures>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDiagnosticSignaturesForBuildV1(id: String,
                                                   fields: [ListDiagnosticSignaturesForBuildV1.Field]? = nil,
                                                   filters: [ListDiagnosticSignaturesForBuildV1.Filter]? = nil,
                                                   limit: Int? = nil) -> Request<DiagnosticSignaturesResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/diagnosticSignatures",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                limit: limit))
    }
}

public enum ListDiagnosticSignaturesForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type diagnosticSignatures
        case diagnosticSignatures([DiagnosticSignatures])

        public enum DiagnosticSignatures: String, Sendable, ParameterValue, Codable, CaseIterable {
            case diagnosticType
            case insight
            case logs
            case signature
            case weight

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = DiagnosticSignatures(rawValue: string) {
                    self = value
                } else if let value = DiagnosticSignatures(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid DiagnosticSignatures value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'diagnosticType'
        case diagnosticType([DiagnosticType])

        public enum DiagnosticType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case diskWrites = "DISK_WRITES"
            case hangs = "HANGS"
            case launches = "LAUNCHES"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = DiagnosticType(rawValue: string) {
                    self = value
                } else if let value = DiagnosticType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid DiagnosticType value: \(string)"
                    )
                }
            }
        }
    }
}
