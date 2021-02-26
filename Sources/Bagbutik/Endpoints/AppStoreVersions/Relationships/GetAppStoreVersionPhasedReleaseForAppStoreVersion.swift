public extension Request {
    enum GetAppStoreVersionPhasedReleaseForAppStoreVersion {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appStoreVersionPhasedReleases
            case appStoreVersionPhasedReleases([AppStoreVersionPhasedReleases])

            public enum AppStoreVersionPhasedReleases: String, ParameterValue, CaseIterable {
                case appStoreVersion
                case currentDayNumber
                case phasedReleaseState
                case startDate
                case totalPauseDuration
            }
        }
    }

    /**
      # Read the App Store Version Phased Release Information of an App Store Version
      Read the phased release status and configuration for a version with phased release enabled.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_store_version_phased_release_information_of_an_app_store_version>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppStoreVersionPhasedReleaseForAppStoreVersion(id: String,
                                                                  fields: [GetAppStoreVersionPhasedReleaseForAppStoreVersion.Field]? = nil) -> Request<AppStoreVersionPhasedReleaseResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)/appStoreVersionPhasedRelease", method: .get, parameters: .init(fields: fields))
    }
}
