public extension Request {
    /**
      # Read Xcode Version Information
      Get information about a specific Xcode version that’s available to Xcode Cloud workflows.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_xcode_version_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related macOsVersions returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getCiXcodeVersion(id: String,
                                  fields: [GetCiXcodeVersion.Field]? = nil,
                                  includes: [GetCiXcodeVersion.Include]? = nil,
                                  limit: Int? = nil) -> Request<CiXcodeVersionResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciXcodeVersions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes,
                                                                                        limit: limit))
    }
}

public enum GetCiXcodeVersion {
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
