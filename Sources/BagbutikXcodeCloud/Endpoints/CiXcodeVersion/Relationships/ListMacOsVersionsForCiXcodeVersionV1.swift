import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # List available macos versions for an xcode version

     List all macOS versions available in Xcode Cloud that support a specific Xcode version.

     ## Discussion

     The example request below lists macOS versions available for a specific Xcode version. Use the information provided in the response to update workflows, build dashboards, and more.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/ciXcodeVersions/b1e1f7b2-14e7-11ec-82a8-0242ac130003/macOsVersions
     ```

     **Response:**

     ```json
     {
         "data": [
             {
                 "type": "ciMacOsVersions",
                 "id": "20G95",
                 "attributes": {
                     "version": "20G95",
                     "name": "macOS Big Sur 11.5.2 (20G95)"
                 },
                 "relationships": {
                     "xcodeVersions": {
                         "links": {
                             "self": "https://api.appstoreconnect.apple.com/v1/ciMacOsVersions/20G95/relationships/xcodeVersions",
                             "related": "https://api.appstoreconnect.apple.com/v1/ciMacOsVersions/20G95/xcodeVersions"
                         }
                     }
                 },
                 "links": {
                     "self": "https://api.appstoreconnect.apple.com/v1/ciMacOsVersions/20G95"
                 }
             }
         ],
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciMacOsVersions"
         },
         "meta": {
             "paging": {
                 "total": 1,
                 "limit": 50
             }
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciXcodeVersions-_id_-macOsVersions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listMacOsVersionsForCiXcodeVersionV1(id: String,
                                                     fields: [ListMacOsVersionsForCiXcodeVersionV1.Field]? = nil,
                                                     includes: [ListMacOsVersionsForCiXcodeVersionV1.Include]? = nil,
                                                     limits: [ListMacOsVersionsForCiXcodeVersionV1.Limit]? = nil) -> Request<CiMacOsVersionsResponse, ErrorResponse> {
        .init(
            path: "/v1/ciXcodeVersions/\(id)/macOsVersions",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum ListMacOsVersionsForCiXcodeVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciMacOsVersions
        case ciMacOsVersions([CiMacOsVersions])
        /// The fields to include for returned resources of type ciXcodeVersions
        case ciXcodeVersions([CiXcodeVersions])

        public enum CiMacOsVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case name
            case version
            case xcodeVersions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiMacOsVersions(rawValue: string) {
                    self = value
                } else if let value = CiMacOsVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiMacOsVersions value: \(string)"
                    )
                }
            }
        }

        public enum CiXcodeVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case macOsVersions
            case name
            case testDestinations
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiXcodeVersions(rawValue: string) {
                    self = value
                } else if let value = CiXcodeVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiXcodeVersions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case xcodeVersions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related xcodeVersions returned (when they are included) - maximum 50
        case xcodeVersions(Int)
    }
}
