public extension Request {
    /**
      # List Available Xcode Versions for a macOS Version
      List all Xcode versions available for a specific macOS version in Xcode Cloud.

      The example request below lists Xcode versions available in Xcode Cloud for a specific macOS version. Use the data provided in the response to display available Xcode versions and test destinations on a dashboard.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_available_xcode_versions_for_a_macos_version>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listXcodeVersionsForCiMacOsVersionV1(id: String,
                                                     fields: [ListXcodeVersionsForCiMacOsVersionV1.Field]? = nil,
                                                     includes: [ListXcodeVersionsForCiMacOsVersionV1.Include]? = nil,
                                                     limits: [ListXcodeVersionsForCiMacOsVersionV1.Limit]? = nil) -> Request<CiXcodeVersionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciMacOsVersions/\(id)/xcodeVersions", method: .get, parameters: .init(fields: fields,
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
