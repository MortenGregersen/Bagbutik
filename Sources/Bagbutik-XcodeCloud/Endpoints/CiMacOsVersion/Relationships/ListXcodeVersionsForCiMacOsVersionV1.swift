import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Available Xcode Versions for a macOS Version
     List all Xcode versions available for a specific macOS version in Xcode Cloud.

     The example request below lists Xcode versions available in Xcode Cloud for a specific macOS version. Use the data provided in the response to display available Xcode versions and test destinations on a dashboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciMacOsVersions-_id_-xcodeVersions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listXcodeVersionsForCiMacOsVersionV1(id: String,
                                                     fields: [ListXcodeVersionsForCiMacOsVersionV1.Field]? = nil,
                                                     includes: [ListXcodeVersionsForCiMacOsVersionV1.Include]? = nil,
                                                     limits: [ListXcodeVersionsForCiMacOsVersionV1.Limit]? = nil) -> Request<CiXcodeVersionsResponse, ErrorResponse> {
        .init(
            path: "/v1/ciMacOsVersions/\(id)/xcodeVersions",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum ListXcodeVersionsForCiMacOsVersionV1 {
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related macOsVersions returned (when they are included) - maximum 50
        case macOsVersions(Int)
    }
}
