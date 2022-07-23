public extension Request {
    /**
      # Read macOS Version Information
      Get information about a specific macOS version that’s available to Xcode Cloud workflows.

      The example request below accesses information about a macOS version available to Xcode Cloud workflows. Use the data provided in the response to read additional information; for example, Xcode versions.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_macos_version_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related xcodeVersions returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getCiMacOsVersionV1(id: String,
                                    fields: [GetCiMacOsVersionV1.Field]? = nil,
                                    includes: [GetCiMacOsVersionV1.Include]? = nil,
                                    limit: Int? = nil) -> Request<CiMacOsVersionResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciMacOsVersions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes,
                                                                                        limit: limit))
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
        case xcodeVersions
    }
}
