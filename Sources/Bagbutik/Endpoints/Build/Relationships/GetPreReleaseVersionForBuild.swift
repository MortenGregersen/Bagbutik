public extension Request {
    /**
      # Read the Prerelease Version of a Build
      Get the prerelease version for a specific build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_prerelease_version_of_a_build>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getPreReleaseVersionForBuild(id: String,
                                             fields: [GetPreReleaseVersionForBuild.Field]? = nil) -> Request<PrereleaseVersionResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/preReleaseVersion", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetPreReleaseVersionForBuild {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type preReleaseVersions
        case preReleaseVersions([PreReleaseVersions])

        public enum PreReleaseVersions: String, ParameterValue, CaseIterable {
            case app
            case builds
            case platform
            case version
        }
    }
}
