public extension Request {
    /**
      # List All macOS Versions Available in Xcode Cloud
      List all macOS versions available to Xcode Cloud workflows.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_macos_versions_available_in_xcode_cloud>

      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listCiMacOsVersions(fields: [ListCiMacOsVersions.Field]? = nil,
                                    includes: [ListCiMacOsVersions.Include]? = nil,
                                    limits: [ListCiMacOsVersions.Limit]? = nil) -> Request<CiMacOsVersionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciMacOsVersions", method: .get, parameters: .init(fields: fields,
                                                                                  includes: includes,
                                                                                  limits: limits))
    }
}

public enum ListCiMacOsVersions {
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
