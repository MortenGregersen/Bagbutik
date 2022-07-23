public extension Request {
    /**
      # List All Xcode Versions Available in Xcode Cloud
      List all Xcode versions that are available to Xcode Cloud workflows.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_xcode_versions_available_in_xcode_cloud>

      The example request below lists Xcode versions available to Xcode Cloud workflows and supported test destinations, including information about available simulated devices. Use the data provided in the response to display available Xcode versions and test destinations on a dashboard or to read additional information; for example, macOS version information.

      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listCiXcodeVersionsV1(fields: [ListCiXcodeVersionsV1.Field]? = nil,
                                      includes: [ListCiXcodeVersionsV1.Include]? = nil,
                                      limits: [ListCiXcodeVersionsV1.Limit]? = nil) -> Request<CiXcodeVersionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciXcodeVersions", method: .get, parameters: .init(fields: fields,
                                                                                  includes: includes,
                                                                                  limits: limits))
    }
}

public enum ListCiXcodeVersionsV1 {
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
