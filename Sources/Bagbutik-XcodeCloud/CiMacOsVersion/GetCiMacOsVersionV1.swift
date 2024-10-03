import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read macOS Version Information
     Get information about a specific macOS version that’s available to Xcode Cloud workflows.

     The example request below accesses information about a macOS version available to Xcode Cloud workflows. Use the data provided in the response to read additional information; for example, Xcode versions.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciMacOsVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related xcodeVersions returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiMacOsVersionV1(id: String,
                                    fields: [GetCiMacOsVersionV1.Field]? = nil,
                                    includes: [GetCiMacOsVersionV1.Include]? = nil,
                                    limit: GetCiMacOsVersionV1.Limit? = nil) -> Request<CiMacOsVersionResponse, ErrorResponse>
    {
        .init(path: "/v1/ciMacOsVersions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                 includes: includes,
                                                                                 limits: limit.map { [$0] }))
    }
}

public enum GetCiMacOsVersionV1 {
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
        }

        public enum CiXcodeVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case macOsVersions
            case name
            case testDestinations
            case version
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
        /// Maximum number of related xcodeVersions returned (when they are included) - maximum 50
        case xcodeVersions(Int)
    }
}
