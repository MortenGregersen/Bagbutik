public extension Request {
    enum ListPreReleaseVersionsForApp {
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

    /**
      # List All Prerelease Versions for an App
      Get a list of prerelease versions associated with a specific app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_prerelease_versions_for_an_app>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPreReleaseVersionsForApp(id: String,
                                             fields: [ListPreReleaseVersionsForApp.Field]? = nil,
                                             limit: Int? = nil) -> Request<PreReleaseVersionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/preReleaseVersions", method: .get, parameters: .init(fields: fields,
                                                                                                limit: limit))
    }
}
