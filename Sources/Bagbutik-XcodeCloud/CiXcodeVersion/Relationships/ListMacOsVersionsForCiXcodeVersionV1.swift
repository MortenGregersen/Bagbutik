import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Available macOS Versions for an Xcode Version
     List all macOS versions available in Xcode Cloud that support a specific Xcode version.

     The example request below lists macOS versions available for a specific Xcode version. Use the information provided in the response to update workflows, build dashboards, and more.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_available_macos_versions_for_an_xcode_version>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listMacOsVersionsForCiXcodeVersionV1(id: String,
                                                     fields: [ListMacOsVersionsForCiXcodeVersionV1.Field]? = nil,
                                                     includes: [ListMacOsVersionsForCiXcodeVersionV1.Include]? = nil,
                                                     limits: [ListMacOsVersionsForCiXcodeVersionV1.Limit]? = nil) -> Request<CiMacOsVersionsResponse, ErrorResponse>
    {
        .init(path: "/v1/ciXcodeVersions/\(id)/macOsVersions", method: .get, parameters: .init(fields: fields,
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

        public enum CiMacOsVersions: String, ParameterValue, Codable, CaseIterable {
            case name
            case version
            case xcodeVersions
        }

        public enum CiXcodeVersions: String, ParameterValue, Codable, CaseIterable {
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related xcodeVersions returned (when they are included) - maximum 50
        case xcodeVersions(Int)
    }
}
