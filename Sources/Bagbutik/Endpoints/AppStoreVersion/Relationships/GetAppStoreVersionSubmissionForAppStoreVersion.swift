public extension Request {
    /**
      # Read the App Store Version Submission Information of an App Store Version
      Get the submission information that is attached to a specific App Store version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_store_version_submission_information_of_an_app_store_version>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAppStoreVersionSubmissionForAppStoreVersion(id: String,
                                                               fields: [GetAppStoreVersionSubmissionForAppStoreVersion.Field]? = nil) -> Request<AppStoreVersionSubmissionResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)/appStoreVersionSubmission", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAppStoreVersionSubmissionForAppStoreVersion {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersionSubmissions
        case appStoreVersionSubmissions([AppStoreVersionSubmissions])

        public enum AppStoreVersionSubmissions: String, ParameterValue, CaseIterable {
            case appStoreVersion
        }
    }
}
