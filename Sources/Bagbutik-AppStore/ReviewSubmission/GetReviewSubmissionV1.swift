import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read review submission information
     Read information about a specific review submisison.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_reviewsubmissions_id>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related items returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getReviewSubmissionV1(id: String,
                                      fields: [GetReviewSubmissionV1.Field]? = nil,
                                      includes: [GetReviewSubmissionV1.Include]? = nil,
                                      limit: Int? = nil) -> Request<ReviewSubmissionResponse, ErrorResponse>
    {
        .init(path: "/v1/reviewSubmissions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                   includes: includes,
                                                                                   limit: limit))
    }
}

public enum GetReviewSubmissionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type reviewSubmissionItems
        case reviewSubmissionItems([ReviewSubmissionItems])
        /// The fields to include for returned resources of type reviewSubmissions
        case reviewSubmissions([ReviewSubmissions])

        public enum ReviewSubmissionItems: String, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageVersion
            case appEvent
            case appStoreVersion
            case appStoreVersionExperiment
            case appStoreVersionExperimentV2
            case removed
            case resolved
            case reviewSubmission
            case state
        }

        public enum ReviewSubmissions: String, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionForReview
            case canceled
            case items
            case lastUpdatedByActor
            case platform
            case state
            case submitted
            case submittedByActor
            case submittedDate
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case appStoreVersionForReview
        case items
        case lastUpdatedByActor
        case submittedByActor
    }
}
