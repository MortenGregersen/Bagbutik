import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Read xcode version information

     Get information about a specific Xcode version that’s available to Xcode Cloud workflows.

     ## Discussion

     The example request below accesses detailed information for a specific Xcode version available to Xcode Cloud workflows. Use the data provided in the response to display available Xcode versions and test destinations on a dashboard or to read additional information; for example, macOS version information.

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/ciXcodeVersions/Xcode12E507:stable
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "ciXcodeVersions",
             "id": "Xcode12E507:stable",
             "attributes": {
                 "version": "Xcode12E507:stable",
                 "name": "Xcode 12.5.1 (12E507)",
                 "testDestinations": [
                     {
                         "deviceTypeName": "iPhone 8",
                         "deviceTypeIdentifier": "com.apple.CoreSimulator.SimDeviceType.iPhone-8",
                         "availableRuntimes": [
                             {
                                 "runtimeName": "iOS 13.0",
                                 "runtimeIdentifier": "com.apple.CoreSimulator.SimRuntime.iOS-13-0"
                             }
                         ],
                         "kind": "SIMULATOR"
                     },
                     {
                         "deviceTypeName": "Mac",
                         "deviceTypeIdentifier": "mac",
                         "availableRuntimes": [
                             {
                                 "runtimeName": "Same as Selected macOS Version",
                                 "runtimeIdentifier": "builder"
                             },
                             {
                                 "runtimeName": "Latest Beta or Release (Currently macOS Big Sur 11.5.2 (20G95))",
                                 "runtimeIdentifier": "latest:all"
                             },
                             {
                                 "runtimeName": "macOS Big Sur 11.5.2 (20G95)",
                                 "runtimeIdentifier": "20G95"
                             }
                         ],
                         "kind": "MAC"
                     },
                     {
                         "deviceTypeName": "Mac (Mac Catalyst)",
                         "deviceTypeIdentifier": "mac_catalyst",
                         "availableRuntimes": [
                             {
                                 "runtimeName": "Same as Selected macOS Version",
                                 "runtimeIdentifier": "builder"
                             },
                             {
                                 "runtimeName": "Latest Beta or Release (Currently macOS Big Sur 11.5.2 (20G95))",
                                 "runtimeIdentifier": "latest:all"
                             },
                             {
                                 "runtimeName": "macOS Big Sur 11.5.2 (20G95)",
                                 "runtimeIdentifier": "20G95"
                             }
                         ],
                         "kind": "MAC"
                     }
                 ]
             },
             "relationships": {
                 "macOsVersions": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/ciXcodeVersions/Xcode12E507:stable/relationships/macOsVersions",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciXcodeVersions/Xcode12E507:stable/macOsVersions"
                     }
                 }
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/ciXcodeVersions/Xcode12E507:stable"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciXcodeVersions/Xcode12E507:stable"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciXcodeVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related macOsVersions returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiXcodeVersionV1(id: String,
                                    fields: [GetCiXcodeVersionV1.Field]? = nil,
                                    includes: [GetCiXcodeVersionV1.Include]? = nil,
                                    limit: GetCiXcodeVersionV1.Limit? = nil) -> Request<CiXcodeVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/ciXcodeVersions/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetCiXcodeVersionV1 {
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
        case macOsVersions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related macOsVersions returned (when they are included) - maximum 50
        case macOsVersions(Int)
    }
}
