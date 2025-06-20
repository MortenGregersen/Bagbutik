import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Beta App Review Submission of a Build
     Get the beta app review submission status for a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-betaAppReviewSubmission>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaAppReviewSubmissionForBuildV1(id: String,
                                                     fields: [GetBetaAppReviewSubmissionForBuildV1.Field]? = nil) -> Request<BetaAppReviewSubmissionWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/betaAppReviewSubmission",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBetaAppReviewSubmissionForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppReviewSubmissions
        case betaAppReviewSubmissions([BetaAppReviewSubmissions])

        public enum BetaAppReviewSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case betaReviewState
            case build
            case submittedDate
        }
    }
}
