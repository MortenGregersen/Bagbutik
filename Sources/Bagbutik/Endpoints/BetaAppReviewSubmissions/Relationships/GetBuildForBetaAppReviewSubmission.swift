public extension Request {
    enum GetBuildForBetaAppReviewSubmission {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type builds
            case builds([Builds])

            public enum Builds: String, ParameterValue, CaseIterable {
                case app
                case appEncryptionDeclaration
                case appStoreVersion
                case betaAppReviewSubmission
                case betaBuildLocalizations
                case betaGroups
                case buildBetaDetail
                case diagnosticSignatures
                case expirationDate
                case expired
                case iconAssetToken
                case icons
                case individualTesters
                case minOsVersion
                case perfPowerMetrics
                case preReleaseVersion
                case processingState
                case uploadedDate
                case usesNonExemptEncryption
                case version
            }
        }
    }

    /**
      # Read the Build Information of a Beta App Review Submission
      Get the build information for a specific beta app review submission.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_build_information_of_a_beta_app_review_submission>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBuildForBetaAppReviewSubmission(id: String,
                                                   fields: [GetBuildForBetaAppReviewSubmission.Field]? = nil) -> Request<BuildResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppReviewSubmissions/\(id)/build", method: .get, parameters: .init(fields: fields))
    }
}
