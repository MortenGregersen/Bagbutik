public extension Request {
    enum GetAppStoreVersionForBuild {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appStoreVersions
            case appStoreVersions([AppStoreVersions])

            public enum AppStoreVersions: String, ParameterValue, CaseIterable {
                case ageRatingDeclaration
                case app
                case appStoreReviewDetail
                case appStoreState
                case appStoreVersionLocalizations
                case appStoreVersionPhasedRelease
                case appStoreVersionSubmission
                case build
                case copyright
                case createdDate
                case downloadable
                case earliestReleaseDate
                case idfaDeclaration
                case platform
                case releaseType
                case routingAppCoverage
                case usesIdfa
                case versionString
            }
        }
    }

    /**
      # Read the App Store Version Information of a Build
      Get the App Store version of a specific build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_store_version_information_of_a_build>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppStoreVersionForBuild(id: String,
                                           fields: [GetAppStoreVersionForBuild.Field]? = nil) -> Request<AppStoreVersionResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/appStoreVersion", method: .get, parameters: .init(fields: fields))
    }
}
