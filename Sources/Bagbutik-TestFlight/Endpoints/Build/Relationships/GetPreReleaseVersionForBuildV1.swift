import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Prerelease Version of a Build
     Get the prerelease version for a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-preReleaseVersion>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPreReleaseVersionForBuildV1(id: String,
                                               fields: [GetPreReleaseVersionForBuildV1.Field]? = nil) -> Request<PrereleaseVersionWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/preReleaseVersion",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetPreReleaseVersionForBuildV1 {
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
