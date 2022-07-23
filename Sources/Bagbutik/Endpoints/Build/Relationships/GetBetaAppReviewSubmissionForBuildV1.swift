public extension Request {
    /**
      # Read the Beta App Review Submission of a Build
      Get the beta app review submission status for a specific build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_beta_app_review_submission_of_a_build>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaAppReviewSubmissionForBuildV1(id: String,
                                                     fields: [GetBetaAppReviewSubmissionForBuildV1.Field]? = nil) -> Request<BetaAppReviewSubmissionResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/betaAppReviewSubmission", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetBetaAppReviewSubmissionForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppReviewSubmissions
        case betaAppReviewSubmissions([BetaAppReviewSubmissions])

        public enum BetaAppReviewSubmissions: String, ParameterValue, CaseIterable {
            case betaReviewState
            case build
            case submittedDate
        }
    }
}
