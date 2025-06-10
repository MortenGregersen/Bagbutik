import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Prerelease Versions for an App
     Get a list of prerelease versions associated with a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-preReleaseVersions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPreReleaseVersionsForAppV1(id: String,
                                               fields: [ListPreReleaseVersionsForAppV1.Field]? = nil,
                                               limit: Int? = nil) -> Request<PreReleaseVersionsWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/preReleaseVersions",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListPreReleaseVersionsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type preReleaseVersions
        case preReleaseVersions([PreReleaseVersions])

        public enum PreReleaseVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case builds
            case platform
            case version
        }
    }
}
