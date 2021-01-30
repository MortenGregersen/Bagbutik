public extension Request {
    enum ListBetaAppReviewSubmissions {
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
         Attributes, relationships, and IDs by which to filter.

         Required: build
         */
        public enum Filter: FilterParameter {
            /// Filter by attribute 'betaReviewState'
            case betaReviewState([BetaReviewState])
            /// Filter by id(s) of related 'build'
            case build([String])

            public enum BetaReviewState: String, ParameterValue, CaseIterable {
                case waitingForReview = "WAITING_FOR_REVIEW"
                case inReview = "IN_REVIEW"
                case rejected = "REJECTED"
                case approved = "APPROVED"
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
      # List Beta App Review Submissions
      Find and list beta app review submissions for all builds.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_beta_app_review_submissions>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaAppReviewSubmissions(fields: [ListBetaAppReviewSubmissions.Field]? = nil,
                                             filters: [ListBetaAppReviewSubmissions.Filter]? = nil,
                                             includes: [ListBetaAppReviewSubmissions.Include]? = nil,
                                             limit: Int? = nil) -> Request<BetaAppReviewSubmissionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppReviewSubmissions", method: .get, parameters: .init(fields: fields,
                                                                                           filters: filters,
                                                                                           includes: includes,
                                                                                           limit: limit))
    }
}
