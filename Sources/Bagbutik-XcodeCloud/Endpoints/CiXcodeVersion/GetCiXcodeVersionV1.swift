import Bagbutik_Core

public extension Request {
    /**
     # Read Xcode Version Information
     Get information about a specific Xcode version that’s available to Xcode Cloud workflows.

     The example request below accesses detailed information for a specific Xcode version available to Xcode Cloud workflows. Use the data provided in the response to display available Xcode versions and test destinations on a dashboard or to read additional information; for example, macOS version information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_xcode_version_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related macOsVersions returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getCiXcodeVersionV1(id: String,
                                    fields: [GetCiXcodeVersionV1.Field]? = nil,
                                    includes: [GetCiXcodeVersionV1.Include]? = nil,
                                    limit: Int? = nil) -> Request<CiXcodeVersionResponse, ErrorResponse>
    {
        .init(path: "/v1/ciXcodeVersions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                 includes: includes,
                                                                                 limit: limit))
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

        public enum CiMacOsVersions: String, ParameterValue, CaseIterable {
            case name
            case version
            case xcodeVersions
        }

        public enum CiXcodeVersions: String, ParameterValue, CaseIterable {
            case macOsVersions
            case name
            case testDestinations
            case version
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case macOsVersions
    }
}
