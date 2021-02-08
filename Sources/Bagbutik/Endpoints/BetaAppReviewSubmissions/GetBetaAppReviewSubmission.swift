public extension Request {
    enum GetBetaAppReviewSubmission {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type betaAppReviewSubmissions
            case betaAppReviewSubmissions([BetaAppReviewSubmissions])
            /// The fields to include for returned resources of type builds
            case builds([Builds])

            public enum BetaAppReviewSubmissions: String, ParameterValue, CaseIterable {
                case betaReviewState
                case build
            }

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

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case build
        }
    }

    /**
      # Read Beta App Review Submission Information
      Get a specific beta app review submission.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_app_review_submission_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBetaAppReviewSubmission(id: String,
                                           fields: [GetBetaAppReviewSubmission.Field]? = nil,
                                           includes: [GetBetaAppReviewSubmission.Include]? = nil) -> Request<BetaAppReviewSubmissionResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppReviewSubmissions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                 includes: includes))
    }
}
